//
//  CreateNewPlaylistViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 21.04.2023.
//

import Foundation

final class CreateNewPlaylistViewModel: ObservableObject {
    
    @Published var songName: String = ""
    @Published var description: String = ""
    
}
