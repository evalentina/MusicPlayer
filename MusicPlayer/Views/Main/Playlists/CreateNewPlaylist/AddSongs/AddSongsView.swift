//
//  AddSongs.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 22.04.2023.
//

import SwiftUI

struct AddSongsView: View {
    
    @StateObject private var viewModel = AddSongsViewModel()
    @ObservedObject var createViewModel: CreateNewPlaylistViewModel
    
    init(viewModel: CreateNewPlaylistViewModel) {
        self.createViewModel = viewModel
        UISearchBar.appearance().overrideUserInterfaceStyle = .dark
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemPink], for: .normal)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(viewModel.searchResults, id: \.self) { song in
                        AddSongCard(song: song, addSongsViewModel: viewModel, createViewModel: createViewModel)
                    }
                    
                }
            }
            .background(Color.backgroundColor)
            .toolbar {
                toolBarContent()
            }
            .navigationBarTitle("", displayMode: .inline)
            .searchable(text: $viewModel.searchingFor)
        }
    }
    
}

private extension AddSongsView {
    
    @ToolbarContentBuilder
    func toolBarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                createViewModel.addedSongs = []
                createViewModel.isShowingAddSong = false
                
            } label: {
                Text("Cancel")
                    .font(.avenir(.medium, size: 20))
                    .foregroundColor(.pinkColor)
                    .padding(10)
            }
        }
        
        ToolbarItem(placement: .principal) {
            Text("Tracks")
                .font(.avenir(.heavy, size: 30))
                .foregroundColor(Color.white)
                .padding(.horizontal, 10)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                // Мне нужно передать addedSongs в parentView
                print(createViewModel.addedSongs)
                createViewModel.isShowingAddSong = false
            } label: {
                Text("Done")
                    .font(.avenir(.medium, size: 20))
                    .foregroundColor(.pinkColor)
                    .padding(10)
            }
        }
    }
}

struct AddSongs_Previews: PreviewProvider {
    static var previews: some View {
        AddSongsView(viewModel: CreateNewPlaylistViewModel())
    }
}
