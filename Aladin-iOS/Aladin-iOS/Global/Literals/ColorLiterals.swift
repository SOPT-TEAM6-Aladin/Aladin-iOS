//
//  ColorLiterals.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/15.
//

import UIKit

extension UIColor {
    
    static var aladinWhite: UIColor {
        return UIColor(hex: "#FFFFFF")
    }
    
    static var aladinBlue: UIColor {
        return UIColor(hex: "#3B499F")
    }
    
    static var aladinBlue2: UIColor {
        return UIColor(hex: "#E8EAF2")
    }
    
    static var aladinYellow: UIColor {
        return UIColor(hex: "#FEB937")
    }
    
    static var aladinPink1: UIColor {
        return UIColor(hex: "#F21D8C")
    }
    
    static var aladinPink2: UIColor {
        return UIColor(hex: "#FF2171")
    }
    
    static var aladinGray1: UIColor {
        return UIColor(hex: "#F3F3F3")
    }
    
    static var aladinGray2: UIColor {
        return UIColor(hex: "#DDDDDD")
    }
    
    static var aladinGray3: UIColor {
        return UIColor(hex: "#CCCCCC")
    }
    
    static var aladinGray4: UIColor {
        return UIColor(hex: "#818181")
    }
    
    static var aladinGray5: UIColor {
        return UIColor(hex: "#5E5E5E")
    }
    
    static var aladinGray6: UIColor {
        return UIColor(hex: "#3D3D3D")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
