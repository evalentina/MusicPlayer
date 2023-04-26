//
//  Searchview.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView {
                }
                .navigationBarTitle("Search")
            }
        }
    }
}

struct Searchview_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:0) {
            
            SearchView()
            
            CustomTabBarView(viewModel: TabBarViewModel())
                .padding(.horizontal)
                .background(Color.backgroundColor)
        }
    }
}
