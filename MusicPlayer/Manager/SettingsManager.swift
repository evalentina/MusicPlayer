//
//  SettingsManager.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 10.05.2023.
//

import SwiftUI

class SettingsManager: ObservableObject {
    
    static let shared = SettingsManager()

    // MARK: UserDefaults
    @AppStorage(AppStorageInfo.logStatus.rawValue) var logStatus: Bool = false
    @AppStorage(AppStorageInfo.userID.rawValue) var userID: String = ""
    
}

