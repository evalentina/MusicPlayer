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

