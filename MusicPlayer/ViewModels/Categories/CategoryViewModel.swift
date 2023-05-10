//
//  CategoryViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 03.05.2023.
//

import Foundation

@MainActor
class CategoryViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var allSongs : [Track] = []
    @Published var searchingFor: String = ""
    var nameCategory: String
    init(isLoading: Bool = true, allSongs: [Track] = [], searchingFor: String = "", nameCategory: String) {
        self.isLoading = isLoading
        self.allSongs = allSongs
        self.searchingFor = searchingFor
        self.nameCategory = nameCategory
    }
    
    var searchResults: [Track] {
        if searchingFor.isEmpty {
            return allSongs
        } else {
            return allSongs.filter { $0.name.lowercased().starts(with: searchingFor.lowercased()) }
        }
    }
    
    func loadSongs() async {
        
        guard let url = URL(string: "https://ws.audioscrobbler.com/2.0/?method=tag.gettoptracks&tag=\(nameCategory.lowercased().replacingOccurrences(of: " ", with: "-", options: .literal, range: nil))&api_key=b098b4ecdf0248bc9cf218b456a2ee60&format&format=json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Song.self, from: data) {
                allSongs = decodedResponse.tracks.track
                isLoading = false
                print(decodedResponse.tracks)
            }
        } catch {
            print("Invalid data")
        }
        
        
    }
    
}
