//
//  PlaylistPage.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 21.04.2023.
//

import SwiftUI

struct PlaylistPage: View {
    
    @Binding var playlist: Playlist
    @Binding var songs: [Track]?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(spacing: 30) {
                    
                    playlistImage()
                    
                    playlistNameText
                    
                    Divider()
                        .background(Color.white)
                    
                    playlistDescription
                    
                    Divider()
                        .background(Color.white)                     
                    
                }
                .padding(.horizontal, 20)
                .font(.avenir(.medium, size: 19))
                .foregroundColor(.lightGrayColor)
            }
            .toolbar {
                toolBarContent()
            }
            .frame(maxWidth: .infinity)
            .background(Color.newPlaylistColor.edgesIgnoringSafeArea(.all))
        }
    }
}

private extension PlaylistPage {
    
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
    
    @ViewBuilder
    func playlistImage() -> some View {
        if let photoData = playlist.photoData,
           let image = UIImage(data: photoData) {
            
            Image(uiImage: image)
                .resizable()
                .cornerRadius(30)
                .frame(width: 270, height: 250)
        } else {
            ZStack {
                if playlist.photoData == nil {
                    Image(ImageName.music.rawValue)
                        .resizable()
                        .cornerRadius(30)
                        .frame(width: 270, height: 250)
                        .foregroundColor(.white)
                }
                
            }
        }
    }
    
    @ToolbarContentBuilder
    func toolBarContent() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text(playlist.playlistName)
                .font(.avenir(.heavy, size: 25))
                .foregroundColor(.white)
                .padding(10)
        }
    }
    
}

struct PlaylistPage_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistPage(playlist:.constant( Playlist(id: 0, playlistName: "Name", playlistDescription: "Description")), songs: .constant(nil))
    }
}
