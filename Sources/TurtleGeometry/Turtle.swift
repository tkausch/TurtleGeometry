//
//  Turtle.swift
//  
//
//  Created by Thomas Kausch on 12.04.20.
//

import Foundation




public protocol TurtleEventDelegate {
    
}



/// The turtle can respond to a few simple commands.
public class Turtle {
    
    /// The turtle's name
    public var name: String
    
    /// Delegate the turtle is sending it's commands
    public var delegate: TurtleEventDelegate?
    
    
    /// The internal turtle state
    var state = TurtleState()
    
    /// Create new turtle with specified name
    /// - Parameter name: turtle name
    public init(name: String) {
        self.name = name
    }
    
    // MARK: - Canonical Turtle  commands
    
    
    /// Set the turtles pen state to`up` so that it does not leave marks when it moves
    /// - Returns: the turtle ater operation is executed
    public func up() -> Self {
        state.isUp = true
        return self
    }
    
    
    /// Set the turtles pen state to `down` so that it leaves marks when it moves.
    /// - Returns: the turtle after operation has finished.
    public func down() -> Self {
        state.isUp = false
        return self
    }
    
    
    /// Move turtle in its current direction a number of bits. If the turtles status is down a line will be drawn.
    /// - Parameter distance: the number of bits to move
    /// - Returns: the turtle after opteration is executed
    public func go(_ distance: Double) -> Self {
        let alpha = (.pi/2) - state.direction.radian
        let translation = Vec2D(cos(alpha) * distance, sin(alpha) * distance)
        state.position = state.position + translation
        return self
    }
    
    /// Change the direction that the turtle faces by an amount equal to the argument  in clock direction.
    /// - Parameter radians: the angle in degrees  clockwise in current direction.
    /// - Returns: the turtle after operation has finished
    public func turn(_ angle: Angle) -> Self {
        let angle = state.direction.radian + angle.radian
        let normalized = angle.remainder(dividingBy: 2 * .pi)
        state.direction = Angle(normalized,.radian)
        return self
    }
    
    /// Move the turtle to position `aPoint`. If the receiver status is `down`, a line will be drawn from current position.
    /// The turtle direction does not change.
    /// - Parameter aPoint: the new point to head for
    /// - Returns: the turtle after operation has finished
    public func goto(aPoint: Vec2D) -> Self {
        state.position = aPoint
        return self
    }
    
    
    /// Set the turtle at position `aPoint`. No lines are drawn. The turtle direction does not change.
    /// - Parameter aPoint: the position to place turtle
    /// - Returns: the turtle after operation has finished
    public func place(aPoint: Vec2D) -> Self {
        state.position = aPoint
        return self
    }

    
    // MARK: - Turtle move operations
    
    
    public func forward(_ distance: Double) -> Self {
        return go(distance)
    }
    
    public func backward(_ distance: Double) -> Self {
        return turn(Angle(.pi,.radian)).go(distance)
    }
    
    public func right(_ angle: Angle) -> Self {
        return turn(angle)
    }
   
    public func left(_ angle: Angle) -> Self {
        return turn(Angle(-angle.radian,.radian))
    }
    
    
    
}
