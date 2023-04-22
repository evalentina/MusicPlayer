//
//  Playlist.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 21.04.2023.
//

import Foundation

struct Playlist: Identifiable, Hashable {
    var id: String
    var playlistName: String
    var playlistDescription: String?
    var photoData: Data?
    
}

struct Song {
    var name: String
}
