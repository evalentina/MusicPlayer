//
//  LoginView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 23.04.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    // MARK: LoginView or SignInView
    @Binding var index : Double
    
    var body: some View {
                
        ZStack(alignment: .bottom) {
            
            VStack(alignment: .leading) {
                
                loginText
                
                VStack(spacing: 20) {
                    
                    emailTextField
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                    
                    passwordTextField
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                forgotPassword
            }
            .padding()
            .padding(.bottom, 45)
            .background(Color.signColor)
            .clipShape(LoginShape())
            .contentShape(LoginShape())
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: -5)
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            loginButton
        }
        // MARK: When user data is entered incorrectly
        .alert(viewModel.errorMessage, isPresented: $viewModel.isShowingLoginError, actions: {})
    }
}

private extension LoginView {
    
    //MARK: The main text is login, switching between Login and Sign In
    var loginText : some View {
        VStack {
            Text("Login")
                .foregroundColor(.white)
                .font(.avenir(.heavy, size: 25))
                .padding()
            
            Capsule()
                .fill(index == 0 ? .blue : .clear)
                .frame(width: 100, height:  5)
        }
        .onTapGesture {
            index = 0
        }
        .padding(.top, 30)
    }
    
    // MARK: Email Text Field
    var emailTextField : some View {
        HStack {
            Image(systemName: ImageName.envelope.rawValue)
                .foregroundColor(.pinkColor)
            
            TextField("", text: $viewModel.email)
                .placeholder(when: viewModel.email.isEmpty, alignment: .leading) {
                    Text("Enter your email...").foregroundColor(.lightGrayColor)
                        .font(.avenir(.medium, size: 20))
                }
                .autocapitalization(.none)
                .foregroundColor(.white)
                .font(.avenir(.medium, size: 22))
            
        }
    }
    
    // MARK: Password Text Field
    var passwordTextField : some View {
        HStack {
            Button {
                viewModel.isSecure.toggle()
            } label: {
                if viewModel.isSecure == true {
                    Image(systemName: ImageName.eyeSlash.rawValue)
                        .foregroundColor(.pinkColor)
                } else {
                    Image(systemName: ImageName.eye.rawValue)
                        .foregroundColor(.pinkColor)
                }
            }
            
            if viewModel.isSecure {
                
                SecureField("", text: $viewModel.password)
                    .placeholder(when: viewModel.password.isEmpty, alignment: .leading) {
                        Text("Enter your password...").foregroundColor(.lightGrayColor)
                            .font(.avenir(.medium, size: 20))
                    }
                    .foregroundColor(.white)
                    .font(.avenir(.medium, size: 22))
            } else {
                
                TextField("", text: $viewModel.password)
                    .placeholder(when: viewModel.password.isEmpty, alignment: .leading) {
                        Text("Enter your password...").foregroundColor(.lightGrayColor)
                            .font(.avenir(.medium, size: 20))
                    }
                    .foregroundColor(.white)
                    .font(.avenir(.medium, size: 22))
            }
        }
    }
    
    // MARK: Forgot your Password Button
    var forgotPassword : some View {
        HStack {
            Spacer()
            Button {
                
            } label: {
                Text("Forgot your password?")
                    .underline()
                    .foregroundColor(.lightGrayColor)
                    .font(.avenir(.medium, size: 17))
            }
        }
        .frame(height: 55)
    }
    
    // MARK: Login Button - go to the main page
    var loginButton : some View {
        Button {
            viewModel.loginUser()
        } label: {
            Text("Login")
                .font(.avenir(.medium, size: 18))
                .frame(width: 100, height: 50)
                .foregroundColor(.white)
                .disabled(viewModel.isButtonDisabled())
                .opacity(viewModel.isButtonDisabled() ? 0.5 : 1)
                .animation(.easeIn(duration: 0.4), value: viewModel.isButtonDisabled())
                .background(Color.pinkColor)
                .clipShape(Capsule())
                .shadow(color: .darkBlueColor.opacity(0.3), radius: 15 , x:5, y: 5)
        }
        
        .offset(y: 20)
        .opacity(index == 0 ? 1 : 0)
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(index: .constant(0))
            .previewLayout(.sizeThatFits)
    }
}
