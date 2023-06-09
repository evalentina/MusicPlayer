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
        
        // MARK: SearchBar dark mode
        UISearchBar.appearance().overrideUserInterfaceStyle = .dark
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemPink], for: .normal)
        
        // MARK: NavigationBar color while scrolling
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor.black
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(viewModel.searchResults, id: \.self) { song in
                            AddSongCard(song: song, createViewModel: createViewModel)
                        }
                    }
                    // MARK: In case no songs were found during the search
                    
                    if viewModel.searchResults.count == 0 {
                        Text("No songs found, try looking for something else")
                            .font(.avenir(.medium, size: 25))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.lightGrayColor)
                            .padding(40)
                    }
                }
                .background(Color.backgroundColor)
                .toolbar {
                    toolBarContent()
                }
                
                .navigationBarTitle("", displayMode: .inline)
                .searchable(text: $viewModel.searchingFor, placement: .navigationBarDrawer(displayMode: .always))
                .task {
                    await viewModel.loadSongs()
                }
            }
        }
        .overlay(
            viewModel.isLoading ? LoadingView(isShowing: $viewModel.isLoading) : nil
        )
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
