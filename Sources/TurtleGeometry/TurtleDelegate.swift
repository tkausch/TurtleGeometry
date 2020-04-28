//
//  TurtleDelegate.swift
//  
//
//  Created by Thomas Kausch on 19.04.20.
//

import Foundation


protocol TurtleDelegate {
    
    func turtle(_ turtle: Turtle, didGoto aPoint: Vec2D)
    func turtle(_ turtle: Turtle, didForward distance: Double)
    func turtle(_ turtle: Turtle, didBackward distance: Double)
    func turtle(_ turtle: Turtle, didPenDown: Bool)
    func turtle(_ turtle: Turtle, didChangePenColor aColor: Color)
    func turtle(_ turtle: Turtle, didChangePenWidth aWidth: Int)
    func turtle(_ turtle: Turtle, didTurnRight aAngle: Double)
    func turtle(_ turtle: Turtle, didTurnLeft aAngle: Double)
    func turtle(_ turtle: Turtle, didTurnRightRND aAngle: Double)
    func turtle(_ turtle: Turtle, didTurnLeftRND aAngle: Double)
    func turtle(_ turtle: Turtle, didForwardRND distance: Double)
    func turtle(_ turtle: Turtle, didBackwardRND distance: Double)
}
