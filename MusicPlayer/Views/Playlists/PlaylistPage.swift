//
//  PlaylistPage.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 21.04.2023.
//

import SwiftUI

struct PlaylistPage: View {
    var body: some View {
        NavigationView {
            
            ScrollView {
               Text("LL")
                    .foregroundColor(.white)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Playlist")
                        .font(.avenir(.heavy, size: 35))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 35)
                }
            }
            .frame(maxWidth: .infinity)
            .background(
                Color.backgroundColor
            )
        }
    }
}

struct PlaylistPage_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistPage()
    }
}
