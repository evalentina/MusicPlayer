//
//  AddSongCard.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 22.04.2023.
//

import SwiftUI

struct ReusableSongsCard: View {
    
    @ObservedObject var viewModel: CreateNewPlaylistViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.addedSongs, id: \.self) { song in
                HStack(spacing: 20) {
                    
                    songImage(song: song)
                    
                    songInfo(song: song)
                    
                }
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .background(Color.newPlaylistColor)
            }
            
        }
    }
}

private extension ReusableSongsCard {
    
    @ViewBuilder
    func songImage(song: Song) -> some View {
        if let imageName = song.songImageData {
            Image(imageName)
                .resizable()
                .cornerRadius(50)
                .frame(width: 50, height: 50)
        } else {
            ZStack {
                Circle()
                    .fill(Color.lightGrayColor)
                    .frame(width: 50, height: 50)
                Image(systemName: ImageName.note.rawValue)
                    .foregroundColor(.black)
            }
        }
    }
    
    @ViewBuilder
    func songInfo(song: Song) -> some View {
        VStack(alignment: .leading) {
            Text(song.songName)
                .font(.avenir(.medium, size: 17))
            Text(song.author)
                .font(.avenir(.medium, size: 14))
                .foregroundColor(.lightGrayColor)
            Divider()
                .background(Color.lightGrayColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .frame(height: 1)
        }
    }
    
}

struct AddSongCard_Previews: PreviewProvider {
    static var previews: some View {
        ReusableSongsCard(viewModel: CreateNewPlaylistViewModel())
    }
}
