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

    // MARK: - Pen operations
    
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
    
    
    // MARK: - Move operations
    
    /// Move turtle in its current direction a number of bits. If the turtles status is down a line will be drawn.
    /// - Parameter distance: the number of bits to move
    /// - Returns: the turtle after opteration is executed
    public func go(_ distance: Double) -> Self {
        let alpha = state.direction
        let translation = Vec2D(cos(alpha) * distance, sin(alpha) * distance)
        state.position = state.position + translation
        return self
    }
    
    /// Change the direction that the turtle faces by an amount equal to the argument  in clock direction.
    /// - Parameter radians: the angle in degrees  clockwise in current direction.
    /// - Returns: the turtle after operation has finished
    public func turn(_ angle: Double) -> Self {
        let angle = state.direction - Angle(angle,.degree).radian
        state.direction = angle.remainder(dividingBy: 2 * .pi)
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
    
    /// Moves the turtle in the direction it is facting some number of units.
    /// - Parameter distance: numer of units to move forward
    /// - Returns: the turtle after move has finished.
    public func forward(_ distance: Double) -> Self {
        return go(distance)
    }
    
    ///  Moves the turtle in the opposite direction it is facing some number of units.
    /// - Parameter distance: the number of units to go
    /// - Returns: the turtle after move has finished
    public func backward(_ distance: Double) -> Self {
        return turn(180).go(distance).turn(180)
    }
    
    /// Change the turtle heading in clockwise direction in whcih the turtle is facing.
    /// - Parameter angle: the angle in degrees to change heading
    /// - Returns: the turtle after move  has finished
    public func right(_ angle: Double) -> Self {
        return turn(angle)
    }
    
    /// Change the turtle heading in anti clockwise direction in which the turtle is facing.
    /// - Parameter angle: the angle to change heading
    /// - Returns: the angle in degfrees  to change the headeing
    public func left(_ angle: Double) -> Self {
        return turn(-angle)
    }
    
}
