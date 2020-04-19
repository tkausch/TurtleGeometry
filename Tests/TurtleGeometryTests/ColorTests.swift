//
//  File.swift
//  
//
//  Created by Thomas Kausch on 17.04.20.
//
import XCTest
@testable import TurtleGeometry

final class ColorTests: XCTestCase {
    
    func testValidHexStringInitializer() {
        let red = Color("FF0000", name: "red")
        let green = Color("00FF00", name: "green")
        let blue = Color("0x0000FF", name: "blue")
        let white = Color("0xFFFFFF", name: "white")
    
        assertColors(red: red, green: green, blue: blue, white: white)
        
    }
    
    func testInvalidHexColorInitializer() {
        XCTAssertNil(Color("0XFFFFFF"))
        XCTAssertNil(Color("0xFF"))
        XCTAssertNil(Color("0xFF0000FF"))
        XCTAssertNil(Color("FFF0000"))
    }
    
    func testValidRGBInitailizer() {
        let red = Color(255, 0, 0, name: "red")
        let green = Color(0, 255, 0, name: "green")
        let blue = Color(0, 0, 255, name: "blue")
        let white = Color(255, 255, 255, name: "white")
        
        assertColors(red: red, green: green, blue: blue, white: white)
    }
    
    func assertColors(red: Color?, green: Color?, blue: Color?, white: Color?) {
        guard let red = red, let green = green, let blue = blue, let white = white else {
            XCTAssertTrue(false, "One color is nil")
            return
        }
        
        XCTAssertTrue(red.r == 255 && red.g == 0 && red.b == 0)
        XCTAssertTrue(green.r == 0 && green.g == 255 && green.b == 0)
        XCTAssertTrue(blue.r == 0 && blue.g == 0 && blue.b == 255)
        XCTAssertTrue(white.r == 255 && white.g == 255 && white.b == 255)
    }

}
