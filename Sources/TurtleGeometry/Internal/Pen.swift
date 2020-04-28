//
//  Pen.swift
//  
//
//  Created by Thomas Kausch on 17.04.20.
//

import Foundation

struct Pen {
    
    /// The  pen drawing mode
    var isDown = true
    
    /// The  pen color
    var color: Color = ColorPalette.green.color
    
    /// The pen strength in points
    var width = 1
    
}
