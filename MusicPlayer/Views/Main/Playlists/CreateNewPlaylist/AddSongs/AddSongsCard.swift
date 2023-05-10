//
//  AddSongCardView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 27.04.2023.
//

import SwiftUI

struct AddSongCard: View {
    
    var song: Track
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
        Image(ImageName.music.rawValue)
            .resizable()
            .frame(width: 50, height: 50)
            .cornerRadius(50)
    }
    
    var songInfo: some View {
        VStack(alignment: .leading) {
            Text(song.name)
                .font(.avenir(.medium, size: 17))
            Text(song.artist.name)
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
                let index = createViewModel.addedSongs.firstIndex(where: {$0.mbid == $0.mbid})
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
        AddSongCard(song: Track(name: "Name", duration: "", mbid: "", url: "", streamable: Streamable(text: "", fulltrack: ""), artist: Artist(name: "Artist", mbid: "", url: ""), image: [], attr: TrackAttr(rank: "")), createViewModel: CreateNewPlaylistViewModel())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
