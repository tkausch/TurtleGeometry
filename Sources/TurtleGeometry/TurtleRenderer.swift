//
//  TurtleImageRenderer.swift
//
//  Created by Thomas Kausch on 19.04.20.
//

import Foundation

#if os (iOS)

import UIKit


public class TurtleRenderer {
    
    private var turtle: Turtle?
    private var canvas: Canvas?
    
    private var cgContext: CGContext!
    
    public init() {
        // do nothing
    }
    
    public  func image(turtle: Turtle, canvas: Canvas, actions: (Turtle) -> Void) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: canvas.size.x, height: canvas.size.y))
        
        self.turtle = turtle
        self.turtle?.delegate = self
        
        let image = renderer.image { (context) in
            self.cgContext = context.cgContext
            actions(self.turtle!)
        }
        
        return image
        
    }
    
}


extension TurtleRenderer : TurtleDelegate {
    
    // MARK: - TurtleDelegate methods
    
    func turtle(_ turtle: Turtle, move aPoint: Vec2D) {
        cgContext?.move(to: CGPoint(x: aPoint.x, y: aPoint.y))
    }
    
    func turtle(_ turtle: Turtle, drawLineFrom from: Vec2D, to: Vec2D) {
        cgContext.beginPath()
        cgContext.move(to: CGPoint(x: from.x, y: from.y))
        cgContext.addLine(to: CGPoint(x: to.x, y: to.y))
        cgContext.drawPath(using: .stroke)
    }
    
    func turtle(_ turtle: Turtle, didChangePenIsUp: Bool) {
        // do nothing
    }
    
    func turtle(_ turtle: Turtle, didChangePenColor: Color) {
        cgContext.setStrokeColor(turtle.state.pen.color.cgColor)
    }
    
    func turtle(_ turtle: Turtle, didChangePenWidth: Int) {
        cgContext.setLineWidth(CGFloat(turtle.state.pen.width))
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
