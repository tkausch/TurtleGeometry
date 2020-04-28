//
//  TurtleImageRenderer.swift
//
//  Created by Thomas Kausch on 19.04.20.
//

import Foundation

#if os (iOS)

import UIKit

public class TurtleRunner {
    
    private var previousState: TurtleState?
    
    private var cgContext: CGContext?
    
    public init() {
    }
    
    public func run(actions: (Turtle) -> Void) -> UIImage {
        
        let defaultSize = Vec2D(800.0,800.0)
        
        let canvas = Canvas(size:defaultSize)
        let turtle = Turtle(name:"DefaultTurtle")
        
        turtle.state.position   = defaultSize * 0.5
        turtle.state.pen.color  = ColorPalette.green.color
        turtle.state.pen.width  = 2
        turtle.state.pen.isDown = true
        
        return run(turtle: turtle, canvas: canvas, actions: actions)
    }
    
    public  func run(turtle: Turtle, canvas: Canvas, actions: (Turtle) -> Void) -> UIImage {
        
        turtle.delegate = self
        previousState = turtle.state
        
        let renderer = UIGraphicsImageRenderer(size: canvas.cgSize)
        let image = renderer.image { (context) in
            self.cgContext = context.cgContext
            actions(turtle)
        }
        return image
        
    }
}

extension TurtleRunner : TurtleDelegate {
    
    func turtle(_ turtle: Turtle, didGoto aPoint: Vec2D) {
        print("🐢 GOTO\(aPoint)")
        cgContext?.move(to: CGPoint(x: aPoint.x, y: aPoint.y))
        previousState = turtle.state
    }
    
    func turtle(_ turtle: Turtle, didForward distance: Double) {
        print("🐢 FORWARD(\(distance))")
        if let previousState = previousState, turtle.state.pen.isDown {
            let currentState = turtle.state
            drawLine(from: previousState.position,
                     to: currentState.position,
                     color: currentState.pen.color,
                     width: currentState.pen.width)
        }
        previousState = turtle.state
    }
    
    func turtle(_ turtle: Turtle, didBackward distance: Double) {
        print("🐢 BACKWARD(\(distance))")
        if let previousState = previousState, turtle.state.pen.isDown {
            let currentState = turtle.state
            drawLine(from: previousState.position,
                     to: currentState.position,
                     color: currentState.pen.color,
                     width: currentState.pen.width)
        }
        previousState = turtle.state
    }
    
    
    func turtle(_ turtle: Turtle, didPenDown: Bool) {
        print("🐢 PEN\(didPenDown ? "DOWN":"UP")")
        previousState = turtle.state
    }
    
    func turtle(_ turtle: Turtle, didChangePenColor aColor: Color) {
        print("🐢 PENCOLOR(\(aColor))")
        previousState = turtle.state
    }
    
    func turtle(_ turtle: Turtle, didChangePenWidth aWidth: Int) {
        print("🐢 PENWIDTH(\(aWidth))")
        previousState = turtle.state
    }
    
    func turtle(_ turtle: Turtle, didTurnRight aAngle: Double) {
        print("🐢 RIGHT(\(aAngle))")
        previousState = turtle.state
    }
    
    func turtle(_ turtle: Turtle, didTurnLeft aAngle: Double) {
        print("🐢 LEFT(\(aAngle))")
        previousState = turtle.state
    }
    
    func turtle(_ turtle: Turtle, didTurnRightRND aAngle: Double) {
        print("🐢 RIGHTRND(\(aAngle))")
        previousState = turtle.state
    }
    
    func turtle(_ turtle: Turtle, didTurnLeftRND aAngle: Double) {
        print("🐢 LEFTRND(\(aAngle))")
        previousState = turtle.state
    }
    
    func turtle(_ turtle: Turtle, didForwardRND distance: Double) {
        print("🐢 FORWARDRND(\(distance))")
        previousState = turtle.state
    }
    
    func turtle(_ turtle: Turtle, didBackwardRND distance: Double) {
        print("🐢 FORWARDRND(\(distance))")
        previousState = turtle.state
    }
    
    
    private func drawLine(from: Vec2D, to: Vec2D, color: Color, width: Int) {
        // set color and line width
        cgContext?.setStrokeColor(color.cgColor)
        cgContext?.setLineWidth(CGFloat(width))
        // add Path
        cgContext?.beginPath()
        cgContext?.move(to: CGPoint(x: from.x, y: from.y))
        cgContext?.addLine(to: CGPoint(x: to.x, y: to.y))
        cgContext?.drawPath(using: .stroke)
    }
    
}

extension Canvas {
    var cgSize: CGSize {
        return CGSize(width: self.size.x, height: self.size.y)
    }
}

extension Color {
    var cgColor : CGColor {
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(Float(g) / 255.0), blue: CGFloat(b) / 255.0, alpha: 1.0).cgColor
    }
}


#endif
