//
//  CategoriesViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 01.05.2023.
//

import Foundation

@MainActor
class CategoriesViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var categories: [Tag] = []
    
    func loadCategories() async {
        guard let url = URL(string: "https://ws.audioscrobbler.com/2.0/?method=chart.gettoptags&api_key=b098b4ecdf0248bc9cf218b456a2ee60&format=json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Сategories.self, from: data) {
                categories = decodedResponse.tags.tag
                isLoading = false
            }
        } catch {
            print("Invalid data")
        }
    }
}

