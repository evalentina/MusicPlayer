//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = TabBarViewModel()
    
    var body: some View {
        VStack(spacing:0) {
            TabView(selection: $viewModel.selectedTab) {
                if viewModel.selectedTab.rawValue == 0 {
                    HomeView()
                } else if viewModel.selectedTab.rawValue == 1 {
                    PlaylistsView()
                } else if viewModel.selectedTab.rawValue == 2 {
                    SearchView()
                } else {
                    ProfileView()
                }
            }
            CustomTabBarView(viewModel: viewModel)
                .padding(.horizontal)
                .background(Color.backgroundColor)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

