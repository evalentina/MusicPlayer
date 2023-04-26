//
//  PlaylistViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 26.04.2023.
//

import Foundation

final class PlaylistsViewModel: ObservableObject {
    
    @Published var isShowingCreateNewPlaylist = false
    @Published var playlists: [Playlist] = []
    @Published var searchingFor: String = ""
    
    var searchResults: [Playlist] {
        if searchingFor.isEmpty {
            return playlists
        } else {
            return playlists.filter { $0.playlistName.lowercased().contains(searchingFor.lowercased()) }
        }
    }
    
}
