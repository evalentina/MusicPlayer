//
//  ProfileView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView {
                }
                .navigationBarTitle("Profile")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:0) {
            
            ProfileView()
            
            CustomTabBarView(viewModel: TabBarViewModel())
                .padding(.horizontal)
                .background(Color.backgroundColor)
        }
    }
}
