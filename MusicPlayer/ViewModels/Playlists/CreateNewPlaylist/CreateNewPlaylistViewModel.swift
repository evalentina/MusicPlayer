//
//  CreateNewPlaylistViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 26.04.2023.
//

import Foundation
protocol AddSongs {
    var addedSongs: [Track] { get }
}

final class CreateNewPlaylistViewModel: ObservableObject, AddSongs {
    
    @Published var selectedPhotoData: Data? = nil
    @Published var playlistName: String = ""
    @Published var description: String = ""
    @Published var isShowingAddSong: Bool = false
    @Published var addedSongs: [Track] = []
    
    func savePlaylist() {
        
    }


}
