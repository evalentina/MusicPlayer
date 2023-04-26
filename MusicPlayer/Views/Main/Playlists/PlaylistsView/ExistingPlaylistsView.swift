//
//  Hepler.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 21.04.2023.
//

import SwiftUI

struct ExistingPlaylistsView: View {

    @ObservedObject var viewModel: PlaylistsViewModel
    
    var body: some View {
        
        ScrollView {
            
            newPlaylistButton
            
            if viewModel.searchResults.count == 0 {
                 
                 playlistsNotFound
             }

            ForEach(viewModel.searchResults, id: \.self) { playlist in
                
                    HStack {
                        
                        playlistImage(playlist: playlist)
                        
                        playlistInfo(playlist: playlist)
     
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
}

private extension ExistingPlaylistsView {
    
    var newPlaylistButton: some View {
        
        Button {
            viewModel.isShowingCreateNewPlaylist = true
        } label: {
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color.lightGrayColor)
                        .frame(width: 90, height: 90)
                        .cornerRadius(15)
                    
                    HStack {
                        Image(systemName: ImageName.musicList.rawValue)
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
    
    @ViewBuilder
    func playlistImage(playlist: Playlist) -> some View {
        if playlist.photoData == nil {
            Image(ImageName.music.rawValue)
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
    }
    
    @ViewBuilder
    func playlistInfo(playlist: Playlist) -> some View {
        
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
                
                goToPlaylistButton
                
            }
            
            Divider()
                .background(Color.lightGrayColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .padding(.leading)
        .frame(height: 90)
    }
    
    
    var goToPlaylistButton: some View {
        
        Button {
            // go to playlist
            // Тут нужно будет добавить, что еще из Firebase ,будут браться сохраненные песни для этого плейлиста
            /*
            PlaylistPage(playlist: $viewModel.playlist)
             */
             
        } label: {
            Image(systemName: ImageName.arrow.rawValue)
                .resizable()
                .foregroundColor(.lightGrayColor)
            
        }
        .frame(width: 15, height: 15,alignment: .trailing)
    }
    
    var playlistsNotFound: some View {
        Text("No playlist found")
            .foregroundColor(.lightGrayColor)
            .font(.avenir(.medium, size: 22))
    }
    
}

struct ExistingPlaylistsView_Previews: PreviewProvider {
    static var previews: some View {
        ExistingPlaylistsView(viewModel: PlaylistsViewModel())
    }
}

