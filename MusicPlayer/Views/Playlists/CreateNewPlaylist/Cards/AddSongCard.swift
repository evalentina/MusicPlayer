//
//  SongCard.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 22.04.2023.
//

import SwiftUI

struct AddSongCard: View {
    
    var song: Song
    @State private var isSongAdded = false
    @Binding var addedSongs : [Song]
    
    var body: some View {
        HStack(spacing: 20) {
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
                    Image(systemName: "music.note")
                        .foregroundColor(.black)
                }
            }
            
            VStack(alignment: .leading) {
                Text(song.songName)
                    .font(.avenir(.medium, size: 17))
                Text(song.author)
                    .font(.avenir(.medium, size: 14))
                    .foregroundColor(.lightGrayColor)
            }
            Spacer()
            
            Button {
                isSongAdded.toggle()
                if isSongAdded == true {
                    addedSongs.append(song)
                } else {
                    let index = addedSongs.firstIndex(where: {$0.songName == $0.songName})
                    if let index = index {
                        addedSongs.remove(at: index)
                    }
                 }
            } label: {
                if isSongAdded {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.lightGrayColor)
                } else {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundColor(.pinkColor)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.white)
        .background(Color.backgroundColor)
    }
}

struct SongCard_Previews: PreviewProvider {
    static var previews: some View {
        AddSongCard(song: Song(id: 0, songName: "Low",author: "Lenny Kravitz", songImageData: "Lenny"), addedSongs: .constant([]))
    }
}
