//
//  SignPageView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 23.04.2023.
//

import SwiftUI

struct SignPageView: View {
    
    // MARK: LoginView or SignInView
    @State var index : Double = 0
    
    @ObservedObject var loginViewModel : LoginViewModel
    @ObservedObject var signInViewModel: SignInViewModel
    
    var body: some View {
        ZStack {
            Color.darkBlueColor.ignoresSafeArea(.all)
            VStack {
                
                appImage
                
                ZStack {
                   
                    SignInView(index: $index)
                        .zIndex(index)
                    
                    LoginView(index: $index)
                        
                }
            }
        }
        .overlay(content: {
            // MARK: LoadingView after the Login button has been pressed, while the user's data is being loaded
            loginViewModel.isLoading ? LoadingView(isShowing: $loginViewModel.isLoading) : nil
            signInViewModel.isLoading ? LoadingView(isShowing: $signInViewModel.isLoading) : nil
        })
    }
}

private extension SignPageView {
    
    // MARK: Apple Music icon
    var appImage : some View {
        Image(ImageName.loginImage.rawValue)
            .resizable()
            .frame(width: 60, height: 60)
            .cornerRadius(20)
            .offset(y: 45)
    }
}

struct SignPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignPageView(loginViewModel: LoginViewModel(), signInViewModel: SignInViewModel())
    }
}
