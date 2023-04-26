//
//  LoginViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 25.04.2023.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password : String = ""
    @Published var isSecure: Bool = true
    
}
