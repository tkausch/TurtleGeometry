//
//  TurtleDelegate.swift
//  
//
//  Created by Thomas Kausch on 19.04.20.
//

import Foundation


public protocol TurtleDelegate {
    
    func turtle(_ turtle: Turtle, move: Vec2D)

    func turtle(_ turtle: Turtle, drawLineFrom: Vec2D, to: Vec2D)
    
    func turtle(_ turtle: Turtle, didChangePenIsUp: Bool)
    
    func turtle(_ turtle: Turtle, didChangePenColor: ColorPalette)
    
    func turtle(_ turtle: Turtle, didChangePenWidth: Int)

    func turtle(_ turtle: Turtle, didChangeHeading: Vec2D)
    
    
}
