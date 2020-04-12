//
//  Vec2D.swift
//  
//
//  Created by Thomas Kausch on 12.04.20.
//

import Foundation

/// Two dimensional Vector
public struct Vec2D {
    
    public var x: Double
    public var y: Double

    public static let origin = Vec2D()
    
    public init(_ x: Double = 0, _ y: Double = 0) {
        self.x = x
        self.y = y
    }
}

public func + (lhs: Vec2D, rhs: Vec2D) -> Vec2D {
    return Vec2D(lhs.x + rhs.x, lhs.y + rhs.y)
}

public func - (lhs: Vec2D, rhs: Vec2D) -> Vec2D {
    return Vec2D(lhs.x - rhs.x, lhs.y - rhs.y)
}

public func * (lhs: Vec2D, rhs: Vec2D) -> Double {
    return lhs.x * rhs.x + lhs.y + rhs.y
}

public func * (lhs: Double, rhs: Vec2D) -> Vec2D {
    return Vec2D(lhs * rhs.x, lhs * rhs.y)
}

public func * (lhs: Vec2D, rhs: Double) -> Vec2D {
    return Vec2D(lhs.x * rhs, lhs.y * rhs)
}

public func abs(_ vec: Vec2D) -> Double {
    return (vec.x * vec.x + vec.y * vec.y).squareRoot()
}