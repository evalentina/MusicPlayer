//
//  Song.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 22.04.2023.
//

import Foundation

struct Song: Identifiable, Hashable {
    var id: Int
    var songName: String
    var author: String
    var songImageData: String?
    
}
extension Song {
    
    static var dummy: Song {
        .init(id: 0, songName: "Low",author: "Lenny Kravitz", songImageData: "Lenny")
    }
    static var dummySongs: [Song] {
        .init(
            [Song(id: 0, songName: "Low",author: "Lenny Kravitz", songImageData: "Lenny"),
              Song(id: 1, songName: "Who is it?",author: "Michael Jackson", songImageData: "off"),
              Song(id: 2, songName: "Off the wall",author: "Michael Jackson", songImageData: "off"),
              Song(id: 3, songName: "On the floor",author: "Michael Jackson", songImageData: "off"),
              Song(id: 4, songName: "Who is it?",author: "Michael Jackson")
        ])
    }
}


