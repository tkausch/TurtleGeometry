//
//  TurtleState.swift
//  
//
//  Created by Thomas Kausch on 12.04.20.
//

import Foundation

/// The Turtle's internal state.
struct TurtleState {
    /// The turtle's  position in x,y cartesian coordinates
    var position: Vec2D = .origin
    
    /// The turtle's heading angle in  radians to x-axis
    var direction: Double = .pi / 2
    
    /// The turtles pen drawing mode
    var isUp: Bool =  false
    
    /// The turtles pen color
    var penColor: Color = ColorPalette.black.color
    
    /// The turtles pen strength in points
    var penStrength: Int = 1
    
}
