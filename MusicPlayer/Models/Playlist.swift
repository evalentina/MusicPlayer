//
//  Playlist.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 21.04.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct Playlist: Identifiable, Hashable, Codable {
    @DocumentID var id: String?
    var playlistName: String
    var playlistDescription: String?
    var songs: [Track]
    var photoData: Data?
    var userUID: String
    
    enum CodingKeys: CodingKey {
        case id
        case playlistName
        case playlistDescription
        case songs
        case photoData
        case userUID
    }
    
}

extension Playlist {
    static var dummyPlaylists: [Playlist] = [
        Playlist(playlistName: "First", playlistDescription: "Checking how the playlist description works", songs: [], userUID: "12"),
            Playlist(playlistName: "Second", playlistDescription: "It's my second playlist", songs: [], userUID: "12"),
            Playlist(playlistName: "Third", playlistDescription: "", songs: [], userUID: "12"),
            Playlist(playlistName: "Fourth", songs: [], userUID: "12")
        ]
}



