//
//  PlaylistsView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI

struct PlaylistsView: View {
    
    @State private var isShowingCreateNewPlaylist = false
    @State private var playlists: [Playlist] = []
    @State var searchingFor: String = ""
    
    init() {
        UISearchBar.appearance().overrideUserInterfaceStyle = .dark
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemPink], for: .normal)
    }
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                if playlists.count == 0 {
                    Spacer(minLength: 200)
                    
                    VStack(spacing: 12) {
                        
                        Text("Looking for your playlists?")
                        
                        Text("Playlists you create will apper here.")
                            .foregroundColor(.lightGrayColor)
                        
                        Button {
                            isShowingCreateNewPlaylist = true
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
                } else {
                    AllPlaylistsView(isShowingCreateNewPlaylist: $isShowingCreateNewPlaylist, playlists: $playlists, searchingFor: $searchingFor)
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Playlists")
                        .font(.avenir(.heavy, size: 35))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 10)
                }
            }
            .searchable(text: $searchingFor)
            .sheet(isPresented: $isShowingCreateNewPlaylist) {
                CreateNewPlaylistView(isShowingCreateNewPlaylist: $isShowingCreateNewPlaylist, playlists: $playlists)
            }
            .frame(maxWidth: .infinity)
            .background(
                Color.backgroundColor
            )
        }
    }
}

struct PlaylistsView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack(spacing:0) {
            
            PlaylistsView()
            
            CustomTabBarView(selectedTab: .constant(.playlists))
                .padding(.horizontal)
                .background(Color.backgroundColor)
        }
    }
}
