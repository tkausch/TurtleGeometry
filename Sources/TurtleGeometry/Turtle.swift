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
        state.pen.isDown = false
        delegate?.turtle(self, didPenDown: false)
        return self
    }
    
    /// Set the turtles pen state to `down` so that it leaves marks when it moves.
    /// - Returns: the turtle after operation has finished.
    @discardableResult
    public func penDown() -> Self {
        state.pen.isDown = true
        delegate?.turtle(self, didPenDown: true)
        return self
    }
    
    /// Set turtles pen color
    /// - Parameter color: the pen color
    @discardableResult
    public  func penColor(_ color: Color) -> Self {
        state.pen.color = color
        delegate?.turtle(self, didChangePenColor: color)
        return self
    }
    
    /// Set turtles pen line width
    /// - Parameter width: pen width
    @discardableResult
    public func penWidth(_ width: Int) -> Self {
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
        state.position = state.position + state.heading * distance
        delegate?.turtle(self, didForward: distance)
        return self
    }
    
    /// Move turtle in its oposit direction a number of bits. If the turtles status is down a line will be drawn.
    /// - Parameter distance: the number of bits to move
    /// - Returns: the turtle after opteration is executed
    @discardableResult
    public func backward(_ distance: Double) -> Self {
        state.position = state.position + state.heading * -distance
        delegate?.turtle(self, didBackward: distance)
        return self
    }
    

    @discardableResult
    public func goto(_ x: Double, _ y: Double) -> Self {
        state.position = Vec2D(x,y)
        delegate?.turtle(self, didGoto: state.position)
        return self
    }
    
    
    fileprivate func newHeading(_ heading: Vec2D, _ alpha: Double) -> Vec2D {
        return Vec2D( heading.x * cos(alpha) - heading.y * sin(alpha) , heading.x * sin(alpha) + heading.y * cos(alpha) )
    }
    
    /// Change the direction that the turtle faces by an amount equal to the argument  in clock direction.
    /// - Parameter radians: the angle in degrees  clockwise in current direction.
    /// - Returns: the turtle after operation has finished
    @discardableResult
    public func turn(_ angle: Double) -> Self {
        let alpha = Angle(angle,unit: .degree).radian
        state.heading = newHeading(state.heading, alpha)
        return self
    }
    
    /// Change the turtle heading in clockwise direction in whcih the turtle is facing.
    /// - Parameter angle: the angle in degrees to change heading
    /// - Returns: the turtle after move  has finished
    @discardableResult
    public func right(_ angle: Double) -> Self {
        turn(angle)
        delegate?.turtle(self, didTurnRight: angle)
        return self
    }
    
    /// Change the turtle heading in anti clockwise direction in which the turtle is facing.
    /// - Parameter angle: the angle to change heading
    /// - Returns: the angle in degfrees  to change the headeing
    @discardableResult
    public func left(_ angle: Double) -> Self {
        turn(-angle)
        delegate?.turtle(self, didTurnLeft: angle)
        return self
    }
    
    // MARK: - Random functions
    
    @discardableResult
    public func rightRND(_ maxAngle: Double) -> Self {
        let alpha = Double.random(in: 0...maxAngle)
        turn(alpha)
        delegate?.turtle(self, didTurnRightRND: alpha)
        return self
    }

    @discardableResult
    public func leftRND(_ maxAngle: Double) -> Self {
        let alpha = Double.random(in: 0...maxAngle)
        turn(-alpha)
        delegate?.turtle(self, didTurnLeftRND: alpha)
        return self
    }
    
    /// Move turtle in its current direction a number of bits. If the turtles status is down a line will be drawn.
     /// - Parameter maxDistance: the number of bits to move
     /// - Returns: the turtle after opteration is executed
     @discardableResult
     public func forwardRND(_ maxDistance: Double) -> Self {
         let distance = Double.random(in: 0...maxDistance)
         state.position = state.position + state.heading * distance
         delegate?.turtle(self, didForwardRND: distance)
         return self
     }
     
     /// Move turtle in its oposit direction a number of bits. If the turtles status is down a line will be drawn.
     /// - Parameter distance: the number of bits to move
     /// - Returns: the turtle after opteration is executed
     @discardableResult
     public func backwardRND(_ maxDistance: Double) -> Self {
         let distance = Double.random(in: 0...maxDistance)
         state.position = state.position + state.heading * -distance
         delegate?.turtle(self, didBackwardRND: distance)
         return self
     }
    
    
    /// Turtle selects a random color.
    @discardableResult
    public func randomColor() -> Self {
        penColor(Color.random())
        return self
    }
    
    /// Turtle selects a random pren wifth
    @discardableResult
    public func randomPenWidth(_ maxWidth: Int = 20) -> Self {
        penWidth(Int.random(in: 1...maxWidth))
        return self
    }
}
