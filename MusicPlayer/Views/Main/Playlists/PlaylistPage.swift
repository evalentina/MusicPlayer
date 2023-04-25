//
//  PlaylistPage.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 21.04.2023.
//

import SwiftUI

struct PlaylistPage: View {
    
    @Binding var playlist: Playlist
    //@Binding var songs: [Song]?
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(spacing: 30) {
                    
                    if let photoData = playlist.photoData,
                       let image = UIImage(data: photoData) {
                        
                        Image(uiImage: image)
                            .resizable()
                            .cornerRadius(30)
                            .frame(width: 270, height: 250)
                    } else {
                        ZStack {
                            if playlist.photoData == nil {
                                Image("music")
                                    .resizable()
                                    .cornerRadius(30)
                                    .frame(width: 270, height: 250)
                                    .foregroundColor(.white)
                            }
                            
                        }
                    }
                    
                    playlistNameText
                    
                    Divider()
                        .background(Color.white)
                    
                    playlistDescription
                    
                    Divider()
                        .background(Color.white)
                    /*
                    SongsCard(songs: $songs)
                     */
                    
                }
                .padding(.horizontal, 20)
                .font(.avenir(.medium, size: 19))
                .foregroundColor(.lightGrayColor)
            }
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    Text(playlist.playlistName)
                        .font(.avenir(.heavy, size: 25))
                        .foregroundColor(.white)
                        .padding(10)
                }
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.newPlaylistColor.edgesIgnoringSafeArea(.all))
        }
        
    }
    var playlistNameText: some View {
        Text(playlist.playlistName)
            .foregroundColor(.lightGrayColor)
            .font(.avenir(.medium, size: 22))
            .multilineTextAlignment(.center)
    }
    
    var playlistDescription: some View {
        Text(playlist.playlistDescription ?? "No description")
            .foregroundColor(.lightGrayColor)
            .font(.avenir(.medium, size: 19))
            .lineLimit(1...4)
    }
    
    
}

struct PlaylistPage_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistPage(playlist:.constant( Playlist(id: 0, playlistName: "Name", playlistDescription: "Description")))
    }
}
