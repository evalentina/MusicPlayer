//
//  SignInViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 25.04.2023.
//
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

final class SignInViewModel: ObservableObject {
    
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var userBio: String = ""
    @Published var userPlaylists: [Playlist] = []
    @Published var userFavorites: [Track] = []
    @Published var repeatPassword : String = ""
    
    @Published var isSecured: Bool =  true
    @Published var isRepeatPasswordSecured: Bool = true
    
    @Published var isPickerShowing: Bool = false
    @Published var userProfileImageData: String = ""
    
    @Published var loginInAccount : Bool = false
    @Published var isShowingLoginError: Bool = false
    @Published var errorMessage : String = ""
    @Published var isLoading: Bool = false
    
    // MARK: UserDefaults
    @Published var settings = SettingsManager.shared
    
    func isButtonDisabled() -> Bool {
        if email == "" || password == "" || repeatPassword == "" || password != repeatPassword {
            return true
        } else {
            return false
        }
    }
    
    func registerUser() {
        isLoading = true
        Task {
            do {
                try await Auth.auth().createUser(withEmail: email, password: password)
                
                // MARK: Profile ImageInto Firebase Storage
                guard let userID = Auth.auth().currentUser?.uid else {
                    return
                }
                //guard let imageData = userProfileImageData else { return }
                //let storageRef = Storage.storage().reference().child("Profile_image").child(userID)
                //let _ = try await storageRef.putDataAsync(imageData)
                //let downloadURL = try await storageRef.downloadURL()
                let user = User(userName: userName, userEmail: email, userPassword: password, userBio: userBio, userPlaylists: userPlaylists, userFavorites: userFavorites, userImageURL: userProfileImageData, userUID: userID)
                
                let _ = try Firestore.firestore().collection("Users").document(userID).setData(from: user, completion: {
                    error in
                    if error == nil {
                        print("User was successfully saved")
                        //self.settings.userNameStored = self.userName
                        self.settings.userID = userID
                        //self.settings.imageURL = downloadURL
                        self.settings.logStatus = true
                    }
                })
                
            } catch {
                // MARK: Delete an account in case of failure
                try await Auth.auth().currentUser?.delete()
                await setError(error)
            }
        }
    }
    
    func setError(_ error: Error) async {
        
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            isShowingLoginError.toggle()
            isLoading = false
        })
        
    }
}

