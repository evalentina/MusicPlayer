//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = TabBarViewModel()
    
    //MARK: Animation for the bottom sheet
    @State private var expandSheet : Bool = false
    @Namespace var animation
    
    var body: some View {
        
        VStack(spacing:0) {
            TabView(selection: $viewModel.selectedTab) {
                if viewModel.selectedTab.rawValue == 0 {
                    HomeView(selection: $viewModel.selectedTab)
                } else if viewModel.selectedTab.rawValue == 1 {
                    PlaylistsView()
                } else if viewModel.selectedTab.rawValue == 2 {
                    SearchView()
                } else {
                    ProfileView()
                }
            }
            
            .safeAreaInset(edge: .bottom,
                           content: customButtonSheet)
            .overlay {
                if expandSheet {
                    ExpandedBottomSheet(expandSheet: $expandSheet, animation: animation)
                        .transition(.asymmetric(insertion: .identity, removal: .offset(y: -5)))
                }
            }
             
            CustomTabBarView(viewModel: viewModel)
                .padding(.horizontal)
                .padding(.top, 10)
                .background(Color.backgroundColor)
                
        }
    }
}

private extension MainView {
    
    @ViewBuilder
    func customButtonSheet() -> some View {
        if expandSheet {
            Rectangle()
                .fill(.clear)
        } else {
            ZStack {
                Rectangle()
                
                    .fill(Color.signColor)
                
                    .overlay(
                        SongInfo(expandSheet: $expandSheet, animation: animation)
                    )
                    .matchedGeometryEffect(id: "BGVIEW", in: animation)
                
            }
            .frame(height: 70)
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

