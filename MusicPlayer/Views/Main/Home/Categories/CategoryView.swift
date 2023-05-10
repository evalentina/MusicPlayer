//
//  CategoryView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 01.05.2023.
//

import SwiftUI

struct CategoryView: View {

    @ObservedObject private var viewModel : CategoryViewModel
   
    init(viewModel: CategoryViewModel) {
        self.viewModel = viewModel
        // MARK: SearchBar dark mode
        UISearchBar.appearance().overrideUserInterfaceStyle = .dark
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemPink], for: .normal)
        
        // MARK: NavigationBar color while scrolling
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor.black
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(viewModel.searchResults, id: \.self) { song in
                            ReusableSongCard(song: song, backgroundCardColor: .backgroundColor)
                                .padding(10)
                        }
                    }
                    // MARK: In case no songs were found during the search
                    
                    if viewModel.searchResults.count == 0 {
                        Text("No songs found, try looking for something else")
                            .font(.avenir(.medium, size: 25))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.lightGrayColor)
                            .padding(40)
                    }
                }
                .toolbar {
                    toolBarContent()
                }
                .navigationBarTitleDisplayMode(.inline)
                .background(Color.backgroundColor)
                .searchable(text: $viewModel.searchingFor, placement: .navigationBarDrawer(displayMode: .always))
                .task {
                    await viewModel.loadSongs()
                }
            }
        }
        .overlay(
            viewModel.isLoading ? LoadingView(isShowing: $viewModel.isLoading) : nil
        )
    }
    
}

private extension CategoryView {
    
    @ToolbarContentBuilder
    func toolBarContent() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text(viewModel.nameCategory.capitalized)
                .font(.avenir(.heavy, size: 25))
                .foregroundColor(Color.white)
                .padding(.horizontal, 10)
        }
    }
    
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(viewModel: CategoryViewModel(nameCategory: "pop"))
    }
}
