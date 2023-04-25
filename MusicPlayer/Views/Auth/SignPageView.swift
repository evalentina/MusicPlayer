//
//  SignPageView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 23.04.2023.
//

import SwiftUI

struct SignPageView: View {
    @State var index : Double = 0
    var body: some View {
        ZStack {
            Color.darkBlueColor.ignoresSafeArea(.all)
            VStack {
                
                Image("music2")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(20)
                    .offset(y: 45)
                
                ZStack {
                   
                    SignInView(index: $index)
                        .zIndex(index)
                    
                    LoginView(index: $index)
                        
                }
            }
        }
    }
}

struct SignPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignPageView()
    }
}
