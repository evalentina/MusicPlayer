//
//  SongCard.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 22.04.2023.
//

import SwiftUI

struct AddSongCard: View {
    
    var song: Song
    @ObservedObject var addSongsViewModel : AddSongsViewModel
    @ObservedObject var createViewModel: CreateNewPlaylistViewModel
    @StateObject var viewModel = AddSongCardViewModel()
    
    var body: some View {
        HStack(spacing: 20) {
            
            songImage
            
            songInfo
            
            Spacer()
            
            addButton
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.white)
        .background(Color.backgroundColor)
    }
}

private extension AddSongCard {
    
    var songImage: some View {
        ZStack {
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
    }
    
    var songInfo: some View {
        VStack(alignment: .leading) {
            Text(song.songName)
                .font(.avenir(.medium, size: 17))
            Text(song.author)
                .font(.avenir(.medium, size: 14))
                .foregroundColor(.lightGrayColor)
        }
    }
    
    var addButton: some View {
        Button {
            viewModel.isSongAdded.toggle()
            if  viewModel.isSongAdded == true {
                createViewModel.addedSongs.append(song)
            } else {
                let index = createViewModel.addedSongs.firstIndex(where: {$0.songName == $0.songName})
                if let index = index {
                    createViewModel.addedSongs.remove(at: index)
                }
             }
        } label: {
            if  viewModel.isSongAdded {
                Image(systemName: ImageName.check.rawValue)
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.lightGrayColor)
            } else {
                Image(systemName: ImageName.plusFill.rawValue)
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(.pinkColor)
            }
        }
    }    
}

struct SongCard_Previews: PreviewProvider {
    static var previews: some View {
        AddSongCard(song: .dummy, addSongsViewModel: AddSongsViewModel(), createViewModel: CreateNewPlaylistViewModel())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
