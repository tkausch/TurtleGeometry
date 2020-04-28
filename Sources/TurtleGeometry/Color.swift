//
//  Color.swift
//  
//
//  Created by Thomas Kausch on 12.04.20.
//

import Foundation

/// Internal representation of colors
public struct Color: CustomStringConvertible, Equatable {

    public let r: UInt8
    public let g: UInt8
    public let b: UInt8

    public let name: String

    
    public init(red: UInt8, green: UInt8, blue: UInt8, name: String) {
        self.r = red
        self.g = green
        self.b = blue
        self.name = name
    }

    public init?(hex: String, name: String? = nil) {
        
        guard (hex.hasPrefix("0x") && hex.count == 8) || hex.count == 6 else {
            return nil
        }
        
        let scanner = Scanner(string: hex)
        var color: UInt64 = 0
        
        if scanner.scanHexInt64(&color) {
            let red = UInt8((color & 0xFF0000) >> 16)
            let green = UInt8((color & 0x00FF00) >> 8)
            let blue = UInt8((color & 0x0000FF) >> 0)
            self.init(red: red, green: green,blue: blue, name: name ?? hex)
        } else {
            return nil
        }
        
    }
    
    
    // MARK: - Random
    public static func random() -> Color {
        return Color(red: UInt8.random(in: 0...255), green: UInt8.random(in: 0...255), blue: UInt8.random(in: 0...255)  , name: "random Color")
    }
    

    // MARK: - CustomStringConvertible

    /// The color description in fomat:  `color-name: (red, green, blue)`
    public var description: String {
        return "\(name)(\(r),\(g),\(b))"
    }

    // MARL: - Equatable

    
    /// Returns true if two colors are equal. 
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return  lhs.r == rhs.r && lhs.g == rhs.g && lhs.b == rhs.b
    }
    
}

