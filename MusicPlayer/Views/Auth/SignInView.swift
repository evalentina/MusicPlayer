//
//  SwiftUIView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 23.04.2023.
//

import SwiftUI

struct SignInView: View {
    
    @Binding var index : Double
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            VStack(alignment: .trailing) {
                
                signInText
                
                VStack(spacing: 20) {
                    
                    emailTextField
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                    
                    
                    passwordTextField
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                    
                    repeatPasswordTextField
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)

            }
            .padding()
            .padding(.bottom, 45)
            .background(Color.signColor)
            .clipShape(SignInShape())
            .contentShape(SignInShape())
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: -5)
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            signInButton
        }
    }
    
}

private extension SignInView {
    
    var signInText : some View {
        VStack {
            Text("Sign in")
                .foregroundColor(.white)
                .font(.avenir(.heavy, size: 25))
                .padding()
            
            Capsule()
                .fill(index == 1 ? .blue : .clear)
                .frame(width: 100, height:  5)
        }
        .onTapGesture {
            index = 1
        }
        .padding(.top, 30)
    }
    
    var emailTextField: some View {
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
    
    var passwordTextField: some View {
        HStack {
            Button {
                viewModel.isSecured.toggle()
            } label: {
                if viewModel.isSecured == true {
                    Image(systemName: ImageName.eyeSlash.rawValue)
                        .foregroundColor(.pinkColor)
                } else {
                    Image(systemName: ImageName.eye.rawValue)
                        .foregroundColor(.pinkColor)
                }
            }
            
            if viewModel.isSecured {
                
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
    
    var repeatPasswordTextField: some View {
        HStack {
            Button {
                viewModel.isRepeatPasswordSecured.toggle()
            } label: {
                if viewModel.isRepeatPasswordSecured {
                    Image(systemName: ImageName.eyeSlash.rawValue)
                        .foregroundColor(.pinkColor)
                } else {
                    Image(systemName: ImageName.eye.rawValue)
                        .foregroundColor(.pinkColor)
                }
            }
            
            if viewModel.isRepeatPasswordSecured {
                
                SecureField("", text: $viewModel.repeatPassword)
                    .placeholder(when: viewModel.repeatPassword.isEmpty, alignment: .leading) {
                        Text("Repeat your password...").foregroundColor(.lightGrayColor)
                            .font(.avenir(.medium, size: 20))
                    }
                    .foregroundColor(.white)
                    .font(.avenir(.medium, size: 22))
            } else {
                
                TextField("", text: $viewModel.repeatPassword)
                    .placeholder(when: viewModel.repeatPassword.isEmpty, alignment: .leading) {
                        Text("Repeat your password...").foregroundColor(.lightGrayColor)
                            .font(.avenir(.medium, size: 20))
                    }
                    .foregroundColor(.white)
                    .font(.avenir(.medium, size: 22))
            }
        }
        .frame(height: 27)
    }
    
    var signInButton: some View {
        Button {
            
        } label: {
            Text("Sign in")
                .font(.avenir(.medium, size: 18))
                .frame(width: 100, height: 50)
                .foregroundColor(.white)
                .background(Color.pinkColor)
                .clipShape(Capsule())
                .shadow(color: .darkBlueColor.opacity(0.3), radius: 15 , x:5, y: 5)
        }
        
        .offset(y: 20)
        .opacity(index == 1 ? 1 : 0)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(index: .constant(1))
    }
}
