//
//  ProfileViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 04.05.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var isLoading: Bool = false
    
    // MARK: UserDefaults
    @Published var settings = SettingsManager.shared
    
    init(user: User? = nil) {
        self.user = user
    }
    
    func logOutUser() {
        
        isLoading = true
        try? Auth.auth().signOut()
        settings.logStatus = false
         
    }
    
    func fetchUserData() async {
        
        
        guard let userID = Auth.auth().currentUser?.uid else { return }
        guard let user = try? await Firestore.firestore().collection("Users").document(userID).getDocument(as: User.self) else { return }
        await MainActor.run(body: {
            self.user = user
        })
         
    }
    
    func refrechData() async {
        
        // MARK: Refresh user data
        self.user = nil
        await fetchUserData()
         
    }
    
    func fetchTask() async {
        
        // MARK: Fetch only for the first time
        if self.user != nil {
            return
        }
        await fetchUserData()
    }
}

