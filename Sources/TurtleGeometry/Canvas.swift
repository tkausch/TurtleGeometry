//
//  File.swift
//  
//
//  Created by Thomas Kausch on 19.04.20.
//

import Foundation

public struct Canvas {

    let size: Vec2D
    let color: ColorPalette

    public init(width: Double, height: Double, color: ColorPalette = .black) {
        self.size = Vec2D(width,height)
        self.color = color
    }
    
    
}
