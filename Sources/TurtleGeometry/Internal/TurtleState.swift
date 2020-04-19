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
    var heading: Vec2D = Vec2D(0,1)
    
    /// The turtl's pen
    var pen: Pen = Pen()
    
}
