//
//  Turtle.swift
//  
//
//  Created by Thomas Kausch on 12.04.20.
//

import Foundation

/// A turtle has three attributes: a `location`, an orientation or `direction`, and a `pen`. The pen, too, has a ` color`, `width`, and `up` or `down` state.
///
/// The turtle moves with commands that are relative to its own position, such as "move forward 10 spaces" and "turn left 90 degrees".
/// The pen carried by the turtle can also be controlled, by enabling it, setting its color, or setting its width.
public class Turtle {
    
    /// The turtle's name
    let name: String
    
    /// Delegate the turtle is sending it's events
    var delegate: TurtleDelegate?
    
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
    @discardableResult
    public func penUp() -> Self {
        state.pen.isUp = true
        delegate?.turtle(self, didChangePenIsUp: true)
        return self
    }
    
    /// Set the turtles pen state to `down` so that it leaves marks when it moves.
    /// - Returns: the turtle after operation has finished.
    @discardableResult
    public func penDown() -> Self {
        state.pen.isUp = false
        delegate?.turtle(self, didChangePenIsUp: false)
        return self
    }
    
    /// Set turtles pen color
    /// - Parameter color: the pen color
    @discardableResult
    public  func setPenColor(_ color: ColorPalette) -> Self {
        state.pen.color = color
        delegate?.turtle(self, didChangePenColor: color)
        return self
    }
    
    /// Set turtles pen line width
    /// - Parameter width: pen width
    @discardableResult
    public func setPenWidth(_ width: Int) -> Self {
        state.pen.width = width
        delegate?.turtle(self, didChangePenWidth: width)
        return self
    }
    
    // MARK: - Move operations
    
    /// Move turtle in its current direction a number of bits. If the turtles status is down a line will be drawn.
    /// - Parameter distance: the number of bits to move
    /// - Returns: the turtle after opteration is executed
    @discardableResult
    public func forward(_ distance: Double) -> Self {
        return move(distance)
    }
    
    /// Move turtle in its oposit direction a number of bits. If the turtles status is down a line will be drawn.
    /// - Parameter distance: the number of bits to move
    /// - Returns: the turtle after opteration is executed
    @discardableResult
    public func backward(_ distance: Double) -> Self {
        return forward(-distance)
    }
    
    /// Move the turtle to position `aPoint`. If the receiver status is `down`, a line will be drawn from current position.
    /// The turtle direction does not change.
    /// - Parameter x: aPoint's x coordinate
    /// - Parameter y: aPoint's y coordinate
    /// - Returns: the turtle after operation has finished
    @discardableResult
    public func move(_ distance: Double) -> Self {
         let previousPosition = state.position
         state.position = previousPosition + distance * state.heading
               if state.pen.isUp {
                   delegate?.turtle(self, move: state.position)
               } else {
                   delegate?.turtle(self, drawLineFrom: previousPosition, to: state.position)
               }
        return self
    }
    
    /// Change the direction that the turtle faces by an amount equal to the argument  in clock direction.
    /// - Parameter radians: the angle in degrees  clockwise in current direction.
    /// - Returns: the turtle after operation has finished
    @discardableResult
    public func turn(_ angle: Double) -> Self {
        let alpha = Angle(angle,unit: .degree).radian
        let heading = state.heading
        state.heading = Vec2D( heading.x * cos(alpha) - heading.y * sin(alpha) , heading.x * sin(alpha) + heading.y * cos(alpha) )
        delegate?.turtle(self, didChangeHeading: state.heading)
        return self
    }
    
    
    /// Change the turtle heading in clockwise direction in whcih the turtle is facing.
    /// - Parameter angle: the angle in degrees to change heading
    /// - Returns: the turtle after move  has finished
    @discardableResult
    public func right(_ angle: Double) -> Self {
        turn(angle)
        delegate?.turtle(self, didChangeHeading: state.heading)
        return self
    }
    
    /// Change the turtle heading in anti clockwise direction in which the turtle is facing.
    /// - Parameter angle: the angle to change heading
    /// - Returns: the angle in degfrees  to change the headeing
    @discardableResult
    public func left(_ angle: Double) -> Self {
        turn(-angle)
        delegate?.turtle(self, didChangeHeading: state.heading)
        return self
    }
    
}
