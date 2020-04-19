//
//  File.swift
//  
//
//  Created by Thomas Kausch on 19.04.20.
//

import Foundation

public protocol Canvas: TurtleDelegate {

    func add(turtle: Turtle)
    
    var size: Vec2D { get }
    
    var color: ColorPalette { get }

}
