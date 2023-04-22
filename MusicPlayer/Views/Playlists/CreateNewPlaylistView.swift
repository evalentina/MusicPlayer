//
//  CreateNewPlaylist.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI
import PhotosUI

struct CreateNewPlaylistView: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedPhotoData: Data? = nil
    @State private var playlistName: String = ""
    @State private var description: String = ""
    
    @Binding var isShowingCreateNewPlaylist: Bool
    @Binding var playlists: [Playlist]
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer(minLength: 70)
                
                VStack(spacing: 30) {
                  
                    if let selectedPhotoData,
                       let image = UIImage(data: selectedPhotoData) {
                        
                        Image(uiImage: image)
                            .resizable()
                            .cornerRadius(30)
                            .frame(width: 270, height: 250)
                    }
                    
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        ZStack {
                            if selectedPhotoData == nil {
                                Image("music")
                                    .resizable()
                                    .cornerRadius(30)
                                    .frame(width: 270, height: 250)
                                    .foregroundColor(.white)
                                Image(systemName: "camera.fill")
                                    .resizable()
                                    .frame(width: 40, height: 30)
                                    .foregroundColor(.white)
                            }
                            
                        }
                    }
                    
                    
                    playlistNameText
                    
                    Divider()
                        .background(Color.white)
                    
                    playlistDescription
                    
                    Divider()
                        .background(Color.white)
                    
                    addSongButton
                    
                }
                .padding(.horizontal, 20)
                .font(.avenir(.medium, size: 19))
                .foregroundColor(.lightGrayColor)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingCreateNewPlaylist = false
                    } label: {
                        Text("Cancel")
                            .font(.avenir(.heavy, size: 20))
                            .foregroundColor(.pinkColor)
                            .padding(10)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("New Playlist")
                        .font(.avenir(.heavy, size: 25))
                        .foregroundColor(.white)
                        .padding(10)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                        playlists.append(Playlist( id: "0", playlistName: playlistName, playlistDescription: playlistDescription as? String, photoData: selectedPhotoData))
                        
                        isShowingCreateNewPlaylist.toggle()
                         
                         savePlaylist()
                         
                    } label: {
                        Text("Done")
                            .font(.avenir(.heavy, size: 20))
                            .foregroundColor(.pinkColor)
                            .padding(10)
                    }
                }
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.newPlaylistColor.edgesIgnoringSafeArea(.all))
            .onChange(of: selectedItem) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedPhotoData = data
                    }
                }
            }
            
        }
    }
    
    func savePlaylist() {
        
    }
    
    
    var playlistNameText: some View {
        TextField("", text: $playlistName)
            .foregroundColor(.white)
            .placeholder(when: playlistName.isEmpty, alignment: .center) {
                Text("Playlist Name")
                    .foregroundColor(.lightGrayColor)
                    .font(.avenir(.medium, size: 22))
            }
            .multilineTextAlignment(.center)
    }
    
    var playlistDescription: some View {
        TextField("", text: $description, axis: .vertical)
            .foregroundColor(.white)
            .placeholder(when: description.isEmpty, alignment: .leading) {
                Text("Description")
                    .foregroundColor(.lightGrayColor)
                    .font(.avenir(.medium, size: 19))
            }
            .lineLimit(1...10)
    }
    
    var addSongButton: some View {
        Button {
            
        } label: {
            HStack(spacing: 15) {
                Image(systemName: "plus")
                    .foregroundColor(.lightGrayColor)
                
                Text("Add song")
                    .foregroundColor(.pinkColor)
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
}

struct CreateNewPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPlaylistView(isShowingCreateNewPlaylist: .constant(true), playlists: .constant(
            [
            Playlist(id: "0", playlistName: "First", playlistDescription: "Checking how the playlist description works"),
            Playlist(id: "1", playlistName: "Second", playlistDescription: "It's my second playlist"),
            Playlist(id: "2", playlistName: "Third", playlistDescription: ""),
            Playlist(id: "3", playlistName: "Fourth")
            ]
        ))
    }
}

extension View {
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}


