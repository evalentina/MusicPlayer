//
//  MusicPlayerApp.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI
import Firebase

@main
struct MusicPlayerApp: App {
    @AppStorage("log_status") var logStatus: Bool = false
    init() {
        FirebaseApp.configure() 
    }
    var body: some Scene {
        WindowGroup {
            if logStatus {
                MainView()
            } else {
                SignPageView(loginViewModel: LoginViewModel(), signInViewModel: SignInViewModel())
            }
        }
    }
}
