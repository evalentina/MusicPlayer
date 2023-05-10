//
//  User.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 04.05.2023.
//

import Foundation

struct User {
    var userName: String
    var userEmail: String
    var userPassword: String
    var description: String
    var playlists: [Playlist]
    var favorites: [Track]
    var userImageURL: URL
    var userUID: String
    
    enum CodingKeys: CodingKey {
        case id
        case userName
        case userEmail
        case userPassword
        case userImageURL
        case userUID
    }
    
}

extension User {
    
    static var dummy: User {
        .init(userName: "Dummy", userEmail: "dummy@gmail.com", userPassword: "123456", description: " Dummy Description", playlists: [], favorites: [], userImageURL: URL(string: "https://img.freepik.com/free-vector/www-concept-illustration_114360-2073.jpg?w=1380&t=st=1683220217~exp=1683220817~hmac=43dbfd45562138599c3e31a3abe103a203774458fce097177ca550e720be1dec")!, userUID: "")
    }
}




