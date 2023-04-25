//
//  LoginView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 23.04.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password : String = ""
    @State var isSecure: Bool = true
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
    }
}

extension LoginView {
    
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
    
    var emailTextField : some View {
        HStack {
            Image(systemName: "envelope.fill")
                .foregroundColor(.pinkColor)
            
            TextField("", text: $email)
                .placeholder(when: email.isEmpty, alignment: .leading) {
                    Text("Enter your email...").foregroundColor(.lightGrayColor)
                        .font(.avenir(.medium, size: 20))
                }
                .autocapitalization(.none)
                .foregroundColor(.white)
                .font(.avenir(.medium, size: 22))
            
        }
    }
    
    var passwordTextField : some View {
        HStack {
            Button {
                isSecure.toggle()
            } label: {
                if isSecure == true {
                    Image(systemName: "eye.slash.fill")
                        .foregroundColor(.pinkColor)
                } else {
                    Image(systemName: "eye.fill")
                        .foregroundColor(.pinkColor)
                }
            }
            
            if isSecure {
                
                SecureField("", text: $password)
                    .placeholder(when: password.isEmpty, alignment: .leading) {
                        Text("Enter your password...").foregroundColor(.lightGrayColor)
                            .font(.avenir(.medium, size: 20))
                    }
                    .foregroundColor(.white)
                    .font(.avenir(.medium, size: 22))
            } else {
                
                TextField("", text: $password)
                    .placeholder(when: password.isEmpty, alignment: .leading) {
                        Text("Enter your password...").foregroundColor(.lightGrayColor)
                            .font(.avenir(.medium, size: 20))
                    }
                    .foregroundColor(.white)
                    .font(.avenir(.medium, size: 22))
            }
        }
    }
    
    var loginButton : some View {
        Button {
            
        } label: {
            Text("Login")
                .font(.avenir(.medium, size: 18))
                .frame(width: 100, height: 50)
                .foregroundColor(.white)
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
