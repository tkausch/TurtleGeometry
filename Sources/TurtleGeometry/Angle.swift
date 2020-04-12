//
//  Angle.swift
//  
//
//  Created by Thomas Kausch on 12.04.20.
//

import Foundation


/// An angle can be represented in degrees or radians.
public struct Angle {

    public enum Unit: String {
        case degree
        case radian
    }

    let value: Double
    let unit: Unit
    
    
    static let zero = Angle(0)

    init(_ value: Double = 0, _ unit: Unit = .degree) {
        self.value = value
        self.unit = unit
    }

    public var degree: Double {
        switch unit {
            case .degree: return value
            case .radian: return value * (180.0 / .pi)
        }
    }

    public var radian: Double {
        switch unit {
            case .degree: return value * (.pi / 180.0)
            case .radian: return value
        }
    }

}
