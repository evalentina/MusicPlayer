//
//  TabBarViewModel.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 26.04.2023.
//

import Foundation

final class TabBarViewModel: ObservableObject {
    @Published var selectedTab: Tabs = .home
}
