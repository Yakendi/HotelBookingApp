//
//  UIColor + extensions.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 01.09.2023.
//

import UIKit

extension UIColor {
    // MARK: - Hex converter
    convenience init?(hex: String, alpha: CGFloat = 1) {
            var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
            
            let length = hexSanitized.count
            
            var rgb: UInt64 = 0
            
            var red: CGFloat = 0.0
            var green: CGFloat = 0.0
            var blue: CGFloat = 0.0
            
            guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
            
            if length == 6 {
                red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
                green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
                blue = CGFloat(rgb & 0x0000FF) / 255.0
            } else if length == 8 {
                red = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
                green = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
                blue = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            } else {
                return nil
            }
            
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
    
    static let mainGray = UIColor(hex: "F6F6F9")
    static let mainOrange = UIColor(hex: "FFA800")
    static let mainBlue = UIColor(hex: "0D72FF")
    
    static let secondGrayText = UIColor(hex: "828796")
    static let secondOrange = UIColor(hex: "FFC700", alpha: 0.2)
}
