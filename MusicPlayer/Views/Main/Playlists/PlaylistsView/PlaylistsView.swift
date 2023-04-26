//
//  PlaylistsView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI

struct PlaylistsView: View {
    
    @StateObject private var viewModel = PlaylistsViewModel()
    
    init() {
        UISearchBar.appearance().overrideUserInterfaceStyle = .dark
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemPink], for: .normal)
    }
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                if viewModel.playlists.count == 0 {
                    Spacer(minLength: 200)
                    
                    playlistsNotFound
                    
                } else {
                    ExistingPlaylistsView(viewModel: viewModel)
                }
            }
            .toolbar {
                toolBarContent()
            }
            .searchable(text: $viewModel.searchingFor)
            .sheet(isPresented: $viewModel.isShowingCreateNewPlaylist) {
                CreateNewPlaylistView(playlistsViewModel: viewModel)
            }
            .frame(maxWidth: .infinity)
            .background(
                Color.backgroundColor
            )
        }
    }
}

private extension PlaylistsView {
    
    var playlistsNotFound: some View {
        VStack(spacing: 12) {
            
            Text("Looking for your playlists?")
            
            Text("Playlists you create will apper here.")
                .foregroundColor(.lightGrayColor)
            
            Button {
                viewModel.isShowingCreateNewPlaylist = true
            } label: {
                Text("New Playlist")
                    .padding()
                    .background(Color.pinkColor)
                    .clipShape(Capsule())
            }
            .padding(.top, 10)
        }
        
        .font(.avenir(.medium, size: 20))
        .foregroundColor(.white)
    }
    
    @ToolbarContentBuilder
    func toolBarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Text("Playlists")
                .font(.avenir(.heavy, size: 30))
                .foregroundColor(Color.white)
                .padding(.horizontal, 10)
        }
    }
    
}

struct PlaylistsView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack(spacing:0) {
            
            PlaylistsView()
            
            CustomTabBarView(viewModel: TabBarViewModel())
                .padding(.horizontal)
                .background(Color.backgroundColor)
        }
    }
}
