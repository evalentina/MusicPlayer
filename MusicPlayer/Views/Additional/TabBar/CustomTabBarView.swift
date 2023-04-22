//
//  CustomTabBarView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var selectedTab: Tabs
    @State private var tabPoints : [CGFloat] = []
    
    var body: some View {
        HStack(alignment: .center) {
            
            TabBarItem(selectedTab: $selectedTab, tabPoints: $tabPoints, text: "Home", imageName: "house", tab: .home)
            
            TabBarItem(selectedTab: $selectedTab, tabPoints: $tabPoints, text: "Playlists", imageName: "music.note.list", tab: .playlists)
            
            TabBarItem(selectedTab: $selectedTab, tabPoints: $tabPoints, text: "Search", imageName: "magnifyingglass", tab: .search)
            
            TabBarItem(selectedTab: $selectedTab, tabPoints: $tabPoints, text: "Profile", imageName: "person", tab: .profile)
            
        }
        .padding()
        .frame(height: 90)
        .background(
            Color.grayColor
                .clipShape(TabCurve(tabPoint: getCurvePoint() - 15)))
        .cornerRadius(30)
    }
    
    func getCurvePoint() -> CGFloat {
        if tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
            case .home:
                return tabPoints[0]
            case .playlists:
                return tabPoints[1]
            case .search:
                return tabPoints[2]
            case .profile:
                return tabPoints[3]
            }
        }
    }
}


enum Tabs: Int, CaseIterable {
    case home = 0
    case playlists = 1
    case search = 2
    case profile = 3
}


