//
//  FontAndColors.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 20.04.2023.
//

import SwiftUI

extension Color {
    
    static var grayColor : Color {
        return Color("GrayColor")
    }
    
    static var backgroundColor : Color {
        return Color("BackgroundColor")
    }
    
    static var signColor : Color {
        return Color("SignColor")
    }
    
    static var darkBlueColor : Color {
        return Color("DarkBlueColor")
    }

    static var pinkColor : Color {
        return Color("PinkColor")
    }
    
    static var lightGrayColor : Color {
        return Color("LightGrayColor")
    }
    
    static var newPlaylistColor : Color {
        return Color("NewPlaylistColor")
    }
    
    static var iconsColor : Color {
        return Color("IconsColor")
    }
    
    static var newPlaylistGrayColor : Color {
        return Color("NewPlaylistGrayColor")
    }
}

extension Font {
    
    enum AvenirFontType {
        case heavy
        case bold
        case medium
        case light
        
        var value: String {
            switch self {
            case .heavy:
                return "Avenir-Heavy"
            case .bold:
                return "Avenir-Bold"
            case .medium:
                return "Avenir-Medium"
            case .light:
                return "Avenir-Light"
            }
        }
    }
    
    static func avenir(_ type: AvenirFontType, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
}


