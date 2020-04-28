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

    public init(size: Vec2D, color: ColorPalette = .black) {
        self.size = size
        self.color = color
    }
    
}
