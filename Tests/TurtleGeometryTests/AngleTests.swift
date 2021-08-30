//
//  File.swift
//  
//
//  Created by Thomas Kausch on 17.04.20.
//
import XCTest
@testable import TurtleGeometry

final class AngleTests: XCTestCase {
    
    func testInitializerDegree() {
        let value = Double.random(in: 5...360)
        let angle = Angle(value)
        
        XCTAssertTrue(angle.value == value)
        XCTAssertTrue(angle.unit == .degree)
        XCTAssertTrue(angle.degree == value)
        XCTAssertTrue(angle.radian == value * (.pi / 180) )
    }
    
    func testInitializerRadian() {
        let value = Double.random(in: 0...(2 * .pi))
        let angle = Angle(value, unit: .radian)
        
        XCTAssertTrue(angle.value == value)
        XCTAssertTrue(angle.unit == .radian)
        XCTAssertTrue(angle.radian == value)
        XCTAssertTrue((angle.degree -  (value / .pi * 180)) < Double.ulpOfOne )
    }
    
}
