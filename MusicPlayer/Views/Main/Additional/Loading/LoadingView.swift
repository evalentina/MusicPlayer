//
//  LoadingView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 26.04.2023.
//

import SwiftUI

struct LoadingView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            Color.backgroundColor
            if isShowing {
                ProgressView()
                    .padding(15)
                    .tint(.white)
                    .background(Color.backgroundColor)
            }
        }
        .ignoresSafeArea()
        .animation(.linear(duration: 0.2), value: isShowing)
    }
}

struct LoadingView_Previews : PreviewProvider {
    static var previews: some View {
        LoadingView(isShowing: .constant(true))
    }
}

