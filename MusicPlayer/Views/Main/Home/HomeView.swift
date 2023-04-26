//
//  HomeView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView {
                }
                .navigationBarTitle("Home")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:0) {
            
           HomeView()
            
            CustomTabBarView(viewModel: TabBarViewModel())
                .padding(.horizontal)
                .background(Color.backgroundColor)
        }
    }
}

