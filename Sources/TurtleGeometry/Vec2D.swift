//
//  Vec2D.swift
//  
//
//  Created by Thomas Kausch on 12.04.20.
//

import Foundation

/// Two dimensional Vector
public struct Vec2D: Equatable {
    
    public let x: Double
    public let y: Double

    static let origin = Vec2D()
    
    public init(_ x: Double = 0, _ y: Double = 0) {
        self.x = x
        self.y = y
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
}

func + (lhs: Vec2D, rhs: Vec2D) -> Vec2D {
    return Vec2D(lhs.x + rhs.x, lhs.y + rhs.y)
}

func - (lhs: Vec2D, rhs: Vec2D) -> Vec2D {
    return Vec2D(lhs.x - rhs.x, lhs.y - rhs.y)
}

func * (lhs: Vec2D, rhs: Vec2D) -> Double {
    return lhs.x * rhs.x + lhs.y * rhs.y
}

func * (lhs: Double, rhs: Vec2D) -> Vec2D {
    return Vec2D(lhs * rhs.x, lhs * rhs.y)
}

func * (lhs: Vec2D, rhs: Double) -> Vec2D {
    return Vec2D(lhs.x * rhs, lhs.y * rhs)
}

func abs(_ vec: Vec2D) -> Double {
    return (vec.x * vec.x + vec.y * vec.y).squareRoot()
}
