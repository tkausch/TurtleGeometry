//
//  File.swift
//  
//
//  Created by Thomas Kausch on 17.04.20.
//
import Foundation

import XCTest
@testable import TurtleGeometry

final class Vector2DTests: XCTestCase {

    func testInitializer() {
        let x = 179836.0
        let y = 899087.4
        
        let vec = Vec2D(x,y)
        
        XCTAssertTrue(vec.x == x && vec.y == y)
    }
    
    func testVectorAddition() {
        let a = randomVec2D()
        let b = randomVec2D()
        let c = Vec2D(a.x + b.x, a.y + b.y)
        
        XCTAssertTrue(a + b == c)
        XCTAssertTrue(b + a == c)
    }
    
    func testVectorSubtraction() {
        let a = randomVec2D()
        let b = randomVec2D()
        let c = Vec2D(a.x - b.x, a.y - b.y)
        
        XCTAssertTrue(a - b == c)
    }

    func testVectorProduct() {
        let a = randomVec2D()
        let b = randomVec2D()
        let c = a.x * b.x + a.y * b.y
        
        XCTAssertTrue(a * b == c)
        XCTAssertTrue(a * b == c)
    }
    
    func testScalarVectorProduct() {
        let a = Double.random(in: -1000...1000)
        let b = randomVec2D()
        let c = Vec2D(a * b.x, a * b.y)
        
        XCTAssertTrue(a * b == c)
        XCTAssertTrue(b * a == c)
        
    }
    
    func testVectorAbs() {
        let vec = randomVec2D()
        let r =  (vec.x * vec.x + vec.y * vec.y).squareRoot()
        
        XCTAssertTrue( abs(vec) == r)
    }
    
    private func randomVec2D() -> Vec2D {
        let x = Double.random(in: -1000...1000)
        let y = Double.random(in: -1000...1000)
        return  Vec2D(x,y)
    }

}
