//
//  AddSongsViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 26.04.2023.
//

import Foundation

@MainActor
final class AddSongsViewModel: ObservableObject {
    
    @Published var allSongs : [Track] = []
    @Published var searchingFor: String = ""
    @Published var isLoading: Bool = true
   
    var searchResults: [Track] {
        if searchingFor.isEmpty {
            return allSongs
        } else {
            return allSongs.filter { $0.name.lowercased().starts(with: searchingFor.lowercased()) }
        }
    }
    
    func loadSongs() async {
        
        guard let url = URL(string: "https://ws.audioscrobbler.com/2.0/?method=tag.gettoptracks&tag=pop&api_key=b098b4ecdf0248bc9cf218b456a2ee60&format=json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Song.self, from: data) {
                allSongs = decodedResponse.tracks.track
                isLoading = false
            }
        } catch {
            print("Invalid data")
        }
        
        
    }
}


