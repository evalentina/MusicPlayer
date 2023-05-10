//
//  CreateNewPlaylist.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI
import PhotosUI

struct CreateNewPlaylistView: View {
    
    @StateObject private var viewModel = CreateNewPlaylistViewModel()
    @ObservedObject var playlistsViewModel: PlaylistsViewModel
    
    @State var selectedItem: PhotosPickerItem? = nil
    
    init(playlistsViewModel: PlaylistsViewModel) {
        self.playlistsViewModel = playlistsViewModel
        
        // MARK: NavigationBar color while scrolling
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .newPlaylistColor
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                Spacer(minLength: 70)
                
                VStack(spacing: 30) {
                    
                    playlistPhoto
                    
                    playlistNameText
                    
                    Divider()
                        .background(Color.white)
                    
                    playlistDescription
                    
                    Divider()
                        .background(Color.white)
                    
                    addSongButton
                    
                    ForEach(viewModel.addedSongs, id: \.self) { song in
                        ReusableSongCard(song: song, backgroundCardColor: .newPlaylistColor)
                    }
                    
                }
                .padding(.horizontal, 20)
                .font(.avenir(.medium, size: 19))
                .foregroundColor(.lightGrayColor)
            }
            .toolbar {
                toolBarContent()
            }
            .frame(maxWidth: .infinity)
            .background(Color.newPlaylistColor.edgesIgnoringSafeArea(.all))
            .onChange(of: selectedItem) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        viewModel.selectedPhotoData = data
                    }
                }
            }
        }
    }
}

private extension CreateNewPlaylistView {
    
    var playlistPhoto: some View {
        
        VStack(spacing: 30) {
            
            if let selectedPhotoData = viewModel.selectedPhotoData,
               let image = UIImage(data: selectedPhotoData) {
                
                Image(uiImage: image)
                    .resizable()
                    .cornerRadius(30)
                    .frame(width: 270, height: 250)
            }
            
            PhotosPicker(selection: $selectedItem, matching: .images) {
                ZStack {
                    if viewModel.selectedPhotoData == nil {
                        Image(ImageName.music.rawValue)
                            .resizable()
                            .cornerRadius(30)
                            .frame(width: 270, height: 250)
                            .foregroundColor(.white)
                        Image(systemName: ImageName.camera.rawValue)
                            .resizable()
                            .frame(width: 40, height: 30)
                            .foregroundColor(.white)
                    }
                    
                }
            }
        }
    }
    
    var playlistNameText: some View {
        TextField("", text: $viewModel.playlistName)
            .foregroundColor(.white)
            .placeholder(when: viewModel.playlistName.isEmpty, alignment: .center) {
                Text("Playlist Name")
                    .foregroundColor(.lightGrayColor)
                    .font(.avenir(.medium, size: 22))
            }
            .multilineTextAlignment(.center)
    }
    
    var playlistDescription: some View {
        TextField("", text: $viewModel.description, axis: .vertical)
            .foregroundColor(.white)
            .placeholder(when: viewModel.description.isEmpty, alignment: .leading) {
                Text("Description")
                    .foregroundColor(.lightGrayColor)
                    .font(.avenir(.medium, size: 19))
            }
            .lineLimit(1...10)
    }
    
    var addSongButton: some View {
        Button {
            viewModel.isShowingAddSong = true
        } label: {
            HStack(spacing: 15) {
                Image(systemName: ImageName.plus.rawValue)
                    .foregroundColor(.lightGrayColor)
                
                Text("Add song")
                    .foregroundColor(.pinkColor)
            }
        }
        .sheet(isPresented: $viewModel.isShowingAddSong) {
            AddSongsView(viewModel: viewModel)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    
    @ToolbarContentBuilder
    func toolBarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                playlistsViewModel.isShowingCreateNewPlaylist = false
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
                
                playlistsViewModel.playlists.append(Playlist(id: 0, playlistName: viewModel.playlistName, playlistDescription: playlistDescription as? String, photoData: viewModel.selectedPhotoData))
                viewModel.savePlaylist()
                playlistsViewModel.isShowingCreateNewPlaylist.toggle()
                
            } label: {
                Text("Done")
                    .font(.avenir(.heavy, size: 20))
                    .foregroundColor(.pinkColor)
                    .padding(10)
            }
        }
    }
}

struct CreateNewPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPlaylistView(playlistsViewModel: PlaylistsViewModel())
    }
}




