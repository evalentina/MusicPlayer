//
//  TabBarItem.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI

struct TabBarItem: View {
    
    @Binding var selectedTab: Tabs
    @Binding var tabPoints: [CGFloat]
    
    var text: String
    var imageName: String
    var tab: Tabs
    
    var body: some View {
        GeometryReader { geometry -> AnyView in
            
            let midX = geometry.frame(in: .global).midX
            
            DispatchQueue.main.async {
                tabPoints.append(midX)
            }
            
            return AnyView(
                Button {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.9)) {
                        selectedTab = tab
                    }
                } label: {
                    VStack(spacing: 7) {
                        Image(systemName: "\(imageName)\((selectedTab == tab && (tab.rawValue == 0 || tab.rawValue == 3)) ? ".fill" : "")")
                        Text(text)
                    }
                    .font(.avenir(.medium, size: 19))
                    .offset(y: selectedTab == tab ? -10: 0)
                    .foregroundColor(.pinkColor)
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
        .frame(height: 50)
        
    }
}



