//
//  SwiftUIView.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 23.04.2023.
//

import SwiftUI

struct SignInView: View {
    
    @State var email: String = ""
    @State var password : String = ""
    @State var repeatPassword : String = ""
    @State var isSecured: Bool = true
    @State var isRepeatPasswordSecured: Bool = true
    @Binding var index : Double
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            VStack(alignment: .trailing) {
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
                
                VStack(spacing: 20) {
                    
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
                    Divider()
                        .background(Color.white.opacity(0.5))
                    
                    HStack {
                        Button {
                            isSecured.toggle()
                        } label: {
                            if isSecured == true {
                                Image(systemName: "eye.slash.fill")
                                    .foregroundColor(.pinkColor)
                            } else {
                                Image(systemName: "eye.fill")
                                    .foregroundColor(.pinkColor)
                            }
                        }
                        
                        if isSecured {
                            
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
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                    
                    HStack {
                        Button {
                            isRepeatPasswordSecured.toggle()
                        } label: {
                            if isRepeatPasswordSecured {
                                Image(systemName: "eye.slash.fill")
                                    .foregroundColor(.pinkColor)
                            } else {
                                Image(systemName: "eye.fill")
                                    .foregroundColor(.pinkColor)
                            }
                        }
                        
                        if isRepeatPasswordSecured {
                            
                            SecureField("", text: $repeatPassword)
                                .placeholder(when: repeatPassword.isEmpty, alignment: .leading) {
                                    Text("Repeat your password...").foregroundColor(.lightGrayColor)
                                        .font(.avenir(.medium, size: 20))
                                }
                                .foregroundColor(.white)
                                .font(.avenir(.medium, size: 22))
                        } else {
                            
                            TextField("", text: $repeatPassword)
                                .placeholder(when: repeatPassword.isEmpty, alignment: .leading) {
                                    Text("Repeat your password...").foregroundColor(.lightGrayColor)
                                        .font(.avenir(.medium, size: 20))
                                }
                                .foregroundColor(.white)
                                .font(.avenir(.medium, size: 22))
                        }
                    }
                    .frame(height: 27)
                    
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
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(index: .constant(1))
    }
}
