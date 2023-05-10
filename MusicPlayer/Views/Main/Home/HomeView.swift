//
//  HomeView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selection: Tabs
    
    init(selection: Binding<Tabs>) {
        self._selection = selection
        // MARK: NavigationBar color while scrolling
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .black
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView {
                    
                    subscriptionInfo
                    
                    CategoriesView()
                }
            }
            .toolbar {
                toolBarContent()
            }
            
        }
    }
}



private extension HomeView {
    
    var subscriptionInfo: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.pinkColor, .black],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .frame(width: 370, height: 400)
                .cornerRadius(23)
                .padding(30)
            VStack {
                Text("80 million songs to play or download. All ad-free")
                    .font(.avenir(.medium, size: 20))
                    .foregroundColor(.white)
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 0) {
                    Image(ImageName.apple.rawValue)
                    Text("Music")
                        .font(.avenir(.medium, size: 50))
                        .foregroundColor(.white)
                }
                Spacer()
                    .frame(height: 100)
                HStack {
                    Text("Try it free")
                    Image(systemName: ImageName.arrow.rawValue)
                }
                .font(.avenir(.light, size: 17))
                .foregroundColor(.white)
                Text("1 month free, then US$4.99/month.")
                    .font(.avenir(.light, size: 17))
                    .foregroundColor(.white)
            }
        }
    }
    
    @ToolbarContentBuilder
    func toolBarContent() -> some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarLeading) {
            Text("Listen Now")
                .font(.avenir(.heavy, size: 25))
                .foregroundColor(.white)
                .padding(10)
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.9)) {
                    selection = .profile
                }
            } label: {
                Image(systemName: ImageName.person.rawValue)
                    .font(.avenir(.heavy, size: 20))
                    .foregroundColor(.pinkColor)
                    .padding(10)
            }
        }
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:0) {
            
            HomeView(selection: .constant(.home))
            
            CustomTabBarView(viewModel: TabBarViewModel())
                .padding(.horizontal)
                .background(Color.backgroundColor)
        }
    }
}

