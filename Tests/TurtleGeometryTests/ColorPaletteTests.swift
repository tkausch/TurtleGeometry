//
//  File.swift
//  
//
//  Created by Thomas Kausch on 17.04.20.
//
import XCTest
@testable import TurtleGeometry

final class ColorPaletteTests: XCTestCase {
    
    func testColorPaletteIsValid() {
        let allColors = ColorPalette.allCases
        for color in allColors {
            XCTAssertNotNil(color)
        }
    }
    
    func testSomeColors() {
        let red = Color("F44336")
        let lime = Color("CDDC39")

        XCTAssertTrue(red == ColorPalette.red.color)
        XCTAssertTrue(lime == ColorPalette.lime.color)
        
    }
}
