//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Tabs = .home
    
    var body: some View {
        VStack(spacing:0) {
            TabView(selection: $selectedTab) {
                if selectedTab.rawValue == 0 {
                    HomeView()
                } else if selectedTab.rawValue == 1 {
                    PlaylistsView()
                } else if selectedTab.rawValue == 2 {
                    SearchView()
                } else {
                    ProfileView()
                }
            }
            CustomTabBarView(selectedTab: $selectedTab)
                .padding(.horizontal)
                .background(Color.backgroundColor)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

