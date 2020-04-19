//
//  Color.swift
//  
//
//  Created by Thomas Kausch on 12.04.20.
//

import Foundation

/// Internal representation of colors
struct Color: CustomStringConvertible, Equatable {

    let r: UInt8
    let g: UInt8
    let b: UInt8

    let name: String

    init(_ red: UInt8, _ green: UInt8, _ blue: UInt8, name: String) {
        self.r = red
        self.g = green
        self.b = blue
        self.name = name
    }

    init?(_ hex: String, name: String? = nil) {
        
        guard (hex.hasPrefix("0x") && hex.count == 8) || hex.count == 6 else {
            return nil
        }
        
        let scanner = Scanner(string: hex)
        var color: UInt64 = 0
        
        if scanner.scanHexInt64(&color) {
            let red = UInt8((color & 0xFF0000) >> 16)
            let green = UInt8((color & 0x00FF00) >> 8)
            let blue = UInt8((color & 0x0000FF) >> 0)
            self.init(red, green, blue, name: name ?? hex)
        } else {
            return nil
        }
        
    }

    // MARK: - CustomStringConvertible

    /// The color description in fomat:  `color-name: (red, green, blue)`
    public var description: String {
        return "\(name): (\(r),\(g),\(b))"
    }

    // MARL: - Equatable
    
    
    /// Returns true if two colors are equal. 
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return  lhs.r == rhs.r && lhs.g == rhs.g && lhs.b == rhs.b
    }
    
}

