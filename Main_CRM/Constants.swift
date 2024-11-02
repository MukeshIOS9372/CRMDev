//
//  Constants.swift
//  ClientRelationShip
//
//  Created by Mukesh Behera on 24/10/24.
//

import Foundation
import UIKit

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

import Foundation
import SwiftUI

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
