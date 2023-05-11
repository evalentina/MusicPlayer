//
//  Playlist.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 21.04.2023.
//

import Foundation

struct Playlist: Identifiable, Hashable, Codable {
    var id: Int
    var playlistName: String
    var playlistDescription: String?
    var photoData: Data?
    
}

extension Playlist {
    static var dummyPlaylists: [Playlist] = [
            Playlist(id: 0, playlistName: "First", playlistDescription: "Checking how the playlist description works"),
            Playlist(id: 1, playlistName: "Second", playlistDescription: "It's my second playlist"),
            Playlist(id: 2, playlistName: "Third", playlistDescription: ""),
            Playlist(id: 3, playlistName: "Fourth")
        ]
}



