//
//  AddSongs.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 22.04.2023.
//

import SwiftUI

struct AddSongsView: View {
    @State private var allSongs: [Song] = [
        Song(id: 0, songName: "Low",author: "Lenny Kravitz", songImageData: "Lenny"),
        Song(id: 1, songName: "Who is it?",author: "Michael Jackson", songImageData: "off"),
        Song(id: 2, songName: "Off the wall",author: "Michael Jackson", songImageData: "off"),
        Song(id: 3, songName: "On the floor",author: "Michael Jackson", songImageData: "off"),
        Song(id: 4, songName: "Who is it?",author: "Michael Jackson")
    ]
    @Binding var addedSongs: [Song]
    @State private var seatchingFor: String = ""
    @State private var addButtonTapped: Bool = false
    @State private var searchingFor: String = ""
    @Binding var isShowingAddSong: Bool
    
    init(addedSongs: Binding<[Song]>, isShowingAddSong: Binding<Bool>) {
        self._addedSongs = addedSongs
        self._isShowingAddSong = isShowingAddSong
        UISearchBar.appearance().overrideUserInterfaceStyle = .dark
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemPink], for: .normal)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(searchResults, id: \.self) { song in
                        AddSongCard(song: song, addedSongs: $addedSongs)
                    }
                    
                }
            }
            .background(Color.backgroundColor)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        addedSongs = []
                        isShowingAddSong = false
                        
                    } label: {
                        Text("Cancel")
                            .font(.avenir(.medium, size: 20))
                            .foregroundColor(.pinkColor)
                            .padding(10)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Tracks")
                        .font(.avenir(.heavy, size: 30))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 10)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Мне нужно передать addedSongs в parentView
                        print(addedSongs)
                        isShowingAddSong = false
                    } label: {
                        Text("Done")
                            .font(.avenir(.medium, size: 20))
                            .foregroundColor(.pinkColor)
                            .padding(10)
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .searchable(text: $searchingFor)
        }
        
    }
    var searchResults: [Song] {
        if searchingFor.isEmpty {
            return allSongs
        } else {
            return allSongs.filter { $0.songName.lowercased().starts(with: searchingFor.lowercased()) }
        }
    }
}

struct AddSongs_Previews: PreviewProvider {
    static var previews: some View {
        AddSongsView(addedSongs: .constant([]), isShowingAddSong: .constant(true))
    }
}
