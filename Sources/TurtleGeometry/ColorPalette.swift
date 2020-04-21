//
//  ColorPalette.swift
//  
//
//  Created by Thomas Kausch on 12.04.20.
//

import Foundation

/// The color palette available for turtle graphics
public enum ColorPalette: String, CaseIterable {

    case black
    case white
    case red
    case pink
    case purple
    case deepPurple
    case indigo
    case blue
    case lightBlue
    case cyan
    case teal
    case green
    case lightGreen
    case lime
    case yellow
    case amber
    case orange
    case deepOrange
    case brown
    case grey
    case blueGrey

    public var color: Color {
        switch self {
        case .black: return Color(hex: "000000", name: self.rawValue)!
        case .white: return Color(hex: "FFFFFF", name: self.rawValue)!
        case .red: return Color(hex: "F44336", name: self.rawValue)!
        case .pink: return Color(hex: "E91E63", name: self.rawValue)!
        case .purple: return Color(hex: "9C27B0", name: self.rawValue)!
        case .deepPurple: return Color(hex: "673AB7", name: self.rawValue)!
        case .indigo: return Color(hex: "3F51B5", name: self.rawValue)!
        case .blue: return Color(hex: "2196F3", name: self.rawValue)!
        case .lightBlue: return Color(hex: "03A9F4", name: self.rawValue)!
        case .cyan: return Color(hex: "00BCD4", name: self.rawValue)!
        case .teal: return Color(hex: "009688", name: self.rawValue)!
        case .green: return Color(hex: "4CAF50", name: self.rawValue)!
        case .lightGreen: return Color(hex: "8BC34A", name: self.rawValue)!
        case .lime: return Color(hex: "CDDC39", name: self.rawValue)!
        case .yellow: return Color(hex: "FFEB3B", name: self.rawValue)!
        case .amber: return Color(hex:"FFC107", name: self.rawValue)!
        case .orange: return Color(hex: "FF9800", name: self.rawValue)!
        case .deepOrange: return Color(hex: "FF5722", name: self.rawValue)!
        case .brown: return Color(hex: "795548", name: self.rawValue)!
        case .grey: return Color(hex: "9E9E9E", name: self.rawValue)!
        case .blueGrey: return Color(hex: "607D8B", name: self.rawValue)!
        }
    }

}
