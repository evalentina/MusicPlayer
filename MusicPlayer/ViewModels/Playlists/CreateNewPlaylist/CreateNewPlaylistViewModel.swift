//
//  CreateNewPlaylistViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 26.04.2023.
//

import Firebase
import FirebaseFirestore
import FirebaseStorage

final class CreateNewPlaylistViewModel: ObservableObject {
    
    @Published var playlistName: String = ""
    @Published var description: String = ""
    @Published var isShowingAddSong: Bool = false
    @Published var addedSongs: [Track] = []
    @Published var selectedPhotoData: Data? = nil
    
    @Published var isLoading: Bool = false
    @Published var isShowingError: Bool = false
    @Published var errorMessage : String = ""
    // MARK: UserDefaults
    @Published var settings = SettingsManager.shared

    
    func savePlaylist() {
        isLoading = true
        Task {
            do {
                let imageReferenceID = "\(settings.userID)\(Date())"
                let storageRef = Storage.storage().reference().child("Playlist_Images").child(imageReferenceID)
                if let playlistImageData = selectedPhotoData {
                    
                    let _ = try await storageRef.putDataAsync(playlistImageData)
                    
                    let playlist = Playlist(playlistName: playlistName, playlistDescription: description, songs: addedSongs, photoData: playlistImageData, userUID: settings.userID)
                    
                    try await createDocumentAtFirebase(playlist)
                    
                } else {
                    let playlist = Playlist(playlistName: playlistName, playlistDescription: description, songs: addedSongs, userUID: settings.userID)
                    try await createDocumentAtFirebase(playlist)
                }
                


            } catch {
                await setError(error)
            }
        }
    }
    
    func createDocumentAtFirebase(_ playlist: Playlist) async throws {
        
        let doc = Firestore.firestore().collection("Playlists").document()
        let _ = try doc.setData(from: playlist, completion: { error in
            if error == nil {
                self.isLoading = false
                var updatedPost = playlist
                updatedPost.id = doc.documentID
            }
            
        })
    }
    
    func setError(_ error: Error) async {
        
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            isShowingError.toggle()
            isLoading = false
        })
        
    }


}
