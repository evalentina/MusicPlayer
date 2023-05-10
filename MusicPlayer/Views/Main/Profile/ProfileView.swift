//
//  ProfileView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    
    var menuItems: [MenuItems] = [.playlists, .favorites, .songs]
    //var myTypes: [Any] = [SearchView.self, CreateNewPlaylistView.self]
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                
                userInformation
                
                menuList()
                    
            }
            .padding()
            
            .toolbar {
                toolBarContent()
            }
            .background(Color.backgroundColor)
        }
    }
    
    
    
}

enum MenuItems: String {
    case playlists
    case songs
    case favorites
}


private extension ProfileView {
    
    // MARK: Profile menu
    @ViewBuilder
    func menuList() -> some View {
        List {
            ForEach(0..<menuItems.count, id: \.self) { index in
                 NavigationLink {
                    self.buildView(items: self.menuItems, index: index)
                } label: {
                    Text(menuItems[index].rawValue.capitalized)
                        .foregroundColor(.pinkColor)
                        .font(.avenir(.light, size: 23))
                }
            }
            .listRowBackground(Color.newPlaylistColor)
        }
       
        .background(Color.backgroundColor)
        .scrollContentBackground(.hidden).background(Color.backgroundColor)
        
    }
    
    // MARK: Toobar content
    @ToolbarContentBuilder
    private func toolBarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Menu {
                Button(role: .destructive) {
                    viewModel.logOutUser()
                } label: {
                    Text("Log out")
                }
            } label : {
                Image(systemName: ImageName.ellipsis.rawValue)
                    .rotationEffect(.init(degrees: 90))
                    .tint(.white)
                    .scaleEffect(0.8)
            }
        }
    }
    
    // MARK: The top stack containing user information
    var userInformation: some View {
        
        VStack(alignment: .center) {
            
            WebImage(url: viewModel.user?.userImageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .clipShape(Circle())
                .overlay(
                    imageOverlay
                )
            Text(viewModel.user?.userName ?? "")
                .font(.avenir(.medium, size: 25))
                .foregroundColor(.white)
            
            Text(viewModel.user?.description ?? "")
                .font(.avenir(.medium, size: 18))
                .foregroundColor(.gray)
        }
        .frame(width: UIScreen.screenWidth, height: 260)
    }
    
    // MARK: Overlay for the user's photo
    var imageOverlay: some View {
        Circle()
            .stroke(Color.black, lineWidth: 7).overlay(
                Circle().fill(Color.red)
                
            )
    }
    
    // MARK: Navigation for list
    func buildView(items: [MenuItems], index: Int) -> AnyView {
        switch items[index].self {
        case .playlists:
            return AnyView(SearchView())
        case .songs:
            return AnyView(SearchView())
        case .favorites:
            return AnyView(SearchView())
        }
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

