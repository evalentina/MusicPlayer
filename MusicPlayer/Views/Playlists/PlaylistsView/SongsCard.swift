//
//  AddSongCard.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 22.04.2023.
//

import SwiftUI

struct SongsCard: View {

    @Binding var songs: [Song]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(songs, id: \.self) { song in
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
                        Divider()
                            .background(Color.lightGrayColor)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                            .frame(height: 1)
                    }
                    
                    
                }
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .background(Color.newPlaylistColor)
            }
            
        }
    }
}

struct AddSongCard_Previews: PreviewProvider {
    static var previews: some View {
        SongsCard(songs: .constant([
            Song(id: 0, songName: "Low",author: "Lenny Kravitz", songImageData: "Lenny"),
            Song(id: 1, songName: "Who is it?",author: "Michael Jackson")
        ]))
    }
}
