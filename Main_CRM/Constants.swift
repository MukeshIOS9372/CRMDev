//
//  Constants.swift
//  ClientRelationShip
//
//  Created by Mukesh Behera on 24/10/24.
//

import Foundation
import UIKit
import SwiftUI

let isIPad = UIDevice.current.userInterfaceIdiom == .pad
let iPadMultiplier: CGFloat = isIPad ? 1.618 : 1.0

enum FontBook: String {
    case Regular = "MYRIADPRO-REGULAR"
    case Semibold = "MYRIADPRO-SEMIBOLD"
    case SemiboldIT = "MYRIADPRO-SEMIBOLDIT"
    case Light = "MyriadPro-Light"
    case Bold = "MYRIADPRO-BOLD"
    case BoldIT = "MYRIADPRO-BOLDIT"
    case CondIt = "MyriadPro-CondIt"
    
    
    func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size) ?? UIFont()
    }
}


extension Color {
    init(hexString hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

enum App_Colors: String {
    case App_Dark_Black_Color = "App_Dark_Black_Color"
    case App_Black_Color = "App_Black_Color"
    case App_Light_Blue_Color = "App_Light_Blue_Color"
    case App_Blue_Color = "App_Blue_Color"
    case App_Light_Gray_Color_1 = "App_Light_Gray_Color_1"
    case App_Light_Gray_Color_2 = "App_Light_Gray_Color_2"
    case App_Light_Gray_Color_3 = "App_Light_Gray_Color_3"
    case App_Light_Gray_Color_4 = "App_Light_Gray_Color_4"
    case App_Light_Green_Color = "App_Light_Green_Color"
    case App_Orange_Color = "App_Orange_Color"
    case App_Red_Color_1 = "App_Red_Color_1"
    case App_Red_Color = "App_Red_Color"
    case App_White_Color = "App_White_Color"
    case App_White_Gray_Color = "App_White_Gray_Color"
}

/*
 3F464B App_Black_Color
 5ED5A8 App_Light_Green_Color
 656C73 App_Light_Gray_Color_2
 FAFAFA App_White_Color
 F0F0F0 App_White_Gray_Color
 D2D4D6 App_Light_Gray_Color_1
 E74C3C App_Red_Color_1
 3B82F6  App_Blue_Color
 ADB1B5  App_Light_Gray_Color_3
 FF9800 App_Orange_Color
 D1D5DB App_Light_Gray_Color_4
 DBEAFE. App_Light_Blue_Color
 F21314 App_Red_Color
 */
