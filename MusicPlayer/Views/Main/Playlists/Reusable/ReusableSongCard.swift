//
//  SongCard.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 22.04.2023.
//

import SwiftUI

struct ReusableSongCard: View {
    
    var song: Track
    var backgroundCardColor: Color
    
    var body: some View {
        
        HStack(spacing: 20) {
            
            songImage()
            
            songInfo(song: song)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.white)
        .background(backgroundCardColor)
    }
}

private extension ReusableSongCard {
    
    @ViewBuilder
    func songImage() -> some View {
        Image(ImageName.music.rawValue)
            .resizable()
            .frame(width: 50, height: 50)
            .cornerRadius(50)
    }
    
    @ViewBuilder
    func songInfo(song: Track) -> some View {
        VStack(alignment: .leading) {
            Text(song.name)
                .font(.avenir(.medium, size: 17))
            Text(song.artist.name)
                .font(.avenir(.medium, size: 14))
                .foregroundColor(.lightGrayColor)
            Divider()
                .background(Color.lightGrayColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .frame(height: 1)
                .padding(5)
        }
    }
    
}

struct Previews_ReusableSongsCard_Previews: PreviewProvider {
    static var previews: some View {
        ReusableSongCard(song: Track(name: "Name", duration: "", mbid: "", url: "", streamable: Streamable(text: "", fulltrack: ""), artist: Artist(name: "Artist", mbid: "", url: ""), image: [], attr: TrackAttr(rank: "")), backgroundCardColor: .backgroundColor)
    }
}

