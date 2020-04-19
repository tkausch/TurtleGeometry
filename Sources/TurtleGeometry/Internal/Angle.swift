//
//  Angle.swift
//  
//
//  Created by Thomas Kausch on 12.04.20.
//

import Foundation


/// An angle can be represented in degrees or radians.
struct Angle {

    enum Unit: String {
        case degree
        case radian
    }

    /// The angle value in degrees or radians
    let value: Double
    
    /// The unit of the angle
    let unit: Unit
    
    static let zero = Angle(0)

    init(_ value: Double, unit: Unit = .degree) {
        self.value = value
        self.unit = unit
    }

    var degree: Double  {
        switch unit {
            case .degree: return value
            case .radian: return value * (180.0 / .pi)
        }
    }

    var radian: Double  {
        switch unit {
            case .degree: return value * (.pi / 180.0)
            case .radian: return value
        }
    }

}
