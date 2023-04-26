//
//  AddSongsViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 26.04.2023.
//

import Foundation

final class AddSongsViewModel: ObservableObject {
    @Published var allSongs: [Song] = [Song(id: 0, songName: "Low",author: "Lenny Kravitz", songImageData: "Lenny"),
                                           Song(id: 1, songName: "Who is it?",author: "Michael Jackson", songImageData: "off"),
                                           Song(id: 2, songName: "Off the wall",author: "Michael Jackson", songImageData: "off"),
                                           Song(id: 3, songName: "On the floor",author: "Michael Jackson", songImageData: "off"),
                                           Song(id: 4, songName: "Who is it?",author: "Michael Jackson")
    ]
    @Published var searchingFor: String = ""
    
    
    var searchResults: [Song] {
        if searchingFor.isEmpty {
            return allSongs
        } else {
            return allSongs.filter { $0.songName.lowercased().starts(with: searchingFor.lowercased()) }
        }
    }
}


