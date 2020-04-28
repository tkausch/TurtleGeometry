//
//  TurtleImageRenderer.swift
//
//  Created by Thomas Kausch on 19.04.20.
//

import Foundation

#if os (iOS)

import UIKit


extension Canvas {
    var cgSize: CGSize {
      return CGSize(width: self.size.x, height: self.size.y)
    }
}



public class TurtleRunner {
    
    private var turtle: Turtle
    private var canvas: Canvas
    
    private var cgContext: CGContext?
    
    
    public init(turtle: Turtle, canvasSize: Vec2D = Vec2D(400.0, 400.0) ) {
        self.canvas = Canvas(size: canvasSize)
        self.turtle = turtle
        
        turtle.delegate = self
        let canvasCenter = 0.5 * canvasSize
        turtle.goto(canvasCenter.x, canvasCenter.y)
    }
    
    public convenience init() {
        self.init(turtle: Turtle(name: "MyTurtle"))
    }
    
    public  func image(actions: (Turtle) -> Void) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: canvas.cgSize)
        
        let image = renderer.image { (context) in
            self.cgContext = context.cgContext
            actions(self.turtle)
        }
        
        return image
        
    }
    
}


extension TurtleRunner : TurtleDelegate {
    
    // MARK: - TurtleDelegate methods
    func turtle(_ turtle: Turtle, move aPoint: Vec2D) {
        cgContext?.move(to: CGPoint(x: aPoint.x, y: aPoint.y))
    }
    
    func turtle(_ turtle: Turtle, drawLineFrom from: Vec2D, to: Vec2D) {
        cgContext?.beginPath()
        cgContext?.move(to: CGPoint(x: from.x, y: from.y))
        cgContext?.addLine(to: CGPoint(x: to.x, y: to.y))
        cgContext?.drawPath(using: .stroke)
    }
    
    func turtle(_ turtle: Turtle, didChangePenIsUp: Bool) {
        // Make sure collor is updated when pen goes down
        if !didChangePenIsUp {
            cgContext?.setStrokeColor(turtle.state.pen.color.cgColor)
            cgContext?.setLineWidth(CGFloat(turtle.state.pen.width))
        }
    }
    
    func turtle(_ turtle: Turtle, didChangePenColor: Color) {
        // do nothing
    }
    
    func turtle(_ turtle: Turtle, didChangePenWidth: Int) {
        // do nothing
    }
    
    func turtle(_ turtle: Turtle, didChangeHeading: Vec2D) {
        // do nothing
    }
}


extension Color {
    
    var cgColor : CGColor {
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(Float(g) / 255.0), blue: CGFloat(b) / 255.0, alpha: 1.0).cgColor
    }
}


#endif
