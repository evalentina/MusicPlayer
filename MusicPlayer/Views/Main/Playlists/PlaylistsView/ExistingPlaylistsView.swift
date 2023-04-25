//
//  Hepler.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 21.04.2023.
//

import SwiftUI

struct ExistingPlaylistsView: View {
    
    @Binding var isShowingCreateNewPlaylist: Bool
    @Binding var playlists: [Playlist]
    @Binding var searchingFor: String
    
    var body: some View {
        
        ScrollView {
            
            newPlaylistButton
            
             if searchResults.count == 0 {
             noPlaylistFound
             }

            ForEach(searchResults, id: \.self) { playlist in
                
                    HStack {
                        if playlist.photoData == nil {
                            Image("music")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .cornerRadius(15)
                        } else {
                            if let photoData = playlist.photoData,
                               let image = UIImage(data: photoData) {
                                
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 90, height: 90)
                                    .cornerRadius(15)
                            }
                        }
                        VStack(alignment: .leading, spacing: 0) {
                            if playlist.playlistName == "" {
                                Text("No name")
                                    .foregroundColor(.white)
                                    .font(.avenir(.medium, size: 22))
                            } else {
                                Text(playlist.playlistName)
                                    .foregroundColor(.white)
                                    .font(.avenir(.medium, size: 22))
                            }
                            HStack {
                                if let description = playlist.playlistDescription, playlist.playlistDescription != ""  {
                                    Text(description)
                                        .foregroundColor(.lightGrayColor)
                                        .font(.avenir(.medium, size: 17))
                                        .fixedSize(horizontal: false, vertical: true)
                                        .lineLimit(1...2)
                                    
                                } else {
                                    Text("The playlist has no description")
                                        .foregroundColor(.lightGrayColor)
                                        .font(.avenir(.medium, size: 17))
                                    
                                    
                                }
                                Spacer()
                                
                                Button {
                                    // go to playlist
                                    // Тут нужно будет добавить, что еще из Firebase ,будут браться сохраненные песни для этого плейлиста
                                    /*
                                    PlaylistPage(playlist: playlist)
                                     */
                                } label: {
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .foregroundColor(.lightGrayColor)
                                    
                                }
                                .frame(width: 15, height: 15,alignment: .trailing)
                                
                            }
                            
                            Divider()
                                .background(Color.lightGrayColor)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        }
                        .padding(.leading)
                        .frame(height: 90)
                        
                    }
                    .padding()
                    .frame(height: 90)
                    
                    Spacer(minLength: 20)
                
            }
        }
        
        .frame(maxWidth: .infinity)
        .background(
            Color.backgroundColor
        )
    }
    
    var searchResults: [Playlist] {
        if searchingFor.isEmpty {
            return playlists
        } else {
            return playlists.filter { $0.playlistName.lowercased().contains(searchingFor.lowercased()) }
        }
    }
    
    var newPlaylistButton: some View {
          
            Button {
                isShowingCreateNewPlaylist = true
            } label: {
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.lightGrayColor)
                            .frame(width: 90, height: 90)
                            .cornerRadius(15)
                        
                        HStack {
                            Image(systemName: "music.note.list")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Spacer(minLength: 25)
                        Text("Create new playlist...")
                            .font(.avenir(.medium, size: 22))
                            .foregroundColor(.white)
                            .frame(alignment: .center)
                        Divider()
                            .background(Color.lightGrayColor)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    }
                    .frame(height: 90)
                    .padding(.leading)
                    
                }

        }
        .padding()
        .frame(height: 100)
    }
    
    var noPlaylistFound: some View {
        Text("No playlist found")
            .foregroundColor(.lightGrayColor)
            .font(.avenir(.medium, size: 22))
    }
}

struct Hepler_Previews: PreviewProvider {
    static var previews: some View {
        ExistingPlaylistsView(isShowingCreateNewPlaylist: .constant(false), playlists: .constant(
            [
                Playlist(id: 0, playlistName: "", playlistDescription: "Checking how the playlist description works"),
                Playlist(id: 1, playlistName: "Second", playlistDescription: "It's my second playlist"),
                Playlist(id: 2, playlistName: "Third", playlistDescription: ""),
                Playlist(id: 3, playlistName: "Fourth")
            ]
        ), searchingFor: .constant(""))
    }
}

