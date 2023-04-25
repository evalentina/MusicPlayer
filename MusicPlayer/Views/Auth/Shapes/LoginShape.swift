//
//  LoginShape.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 25.04.2023.
//

import SwiftUI

struct LoginShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            path.move(to: CGPoint(x: rect.width, y: 130))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
        
    }
}
