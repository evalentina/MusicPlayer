//
//  SignInViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 25.04.2023.
//

import Foundation

final class SignInViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password : String = ""
    @Published var repeatPassword : String = ""
    @Published var isSecured: Bool = true
    @Published var isRepeatPasswordSecured: Bool = true
}
