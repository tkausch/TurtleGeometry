import UIKit
import TurtleGeometry
//: # Circles
//: After all these straight line drawings, it is natural to ask weather the turtle can also draw curves - circles, for example. One easy way to do this is to make the turtle go `FORWARD` a little bit and then turn `RIGHT` a little bit, and repeat this over and over. When we will study the mathematics of turtle geometry, we'll see that the turtle circle closes precisely when the turtle has turned through 360 Degree. So if we generate the circle in chunks of `FORWARD 1`, `RIGHT 1`, the circle will close after precisely 360 chunks:
let circle = TurtleRunner().run() { 🐢 in
    for _ in 1...360 {
        🐢.forward(1)
        🐢.right(1)
    }
}
//: If we repeat the basic chunk fewer than 360 times, we get circulare arcs. For instance, 180 repetitions give a semicircle, and 60 repetitions give a 60 Degree arc. The following procedure draw left and right arcs of `DEG` degrees on a circle of size R.
extension Turtle {
    func arcright(_ size: Double, _ angle: Double) -> Self {
        for _ in 1...Int(angle) {
            forward(size)
            right(1)
        }
        return self
    }
    func arcleft(_ size: Double, _ angle: Double) -> Self {
        for _ in 1...Int(angle) {
            forward(size)
            left(1)
        }
        return self
    }
}
//: The circle program above acutally draws regular "360gons", of course, rather than "real" circles, but for the prupose of making drawings on the display screen this difference is irrelevant - a screen consists of a matrix of pixels.
let circles = TurtleRunner().run() { 🐢 in
    🐢.penColor(ColorPalette.lightBlue.color)
    for _ in 1...9 {
        🐢.arcright(2, 360)
        🐢.right(40)
    }
}
//: Using `ARCL` and `ARCR` procedures we can draw flower  like picutres:
extension Turtle {
    func petal(_ size: Double) -> Self {
        arcright(size, 60)
        right(120)
        arcright(size, 60)
        right(120)
        return self
    }
}
let flower = TurtleRunner().run() { 🐢 in
    for _ in 1...6 {
        🐢.petal(3)
        🐢.right(60)
    }
}
//: Another shape using `arcs`looks like a sun:
extension Turtle {
    func ray(_ size: Double) -> Self {
        for _ in 1...2 {
            arcright(size, 90)
            arcleft(size, 90)
        }
        return self
    }
}
let sun = TurtleRunner().run() { 🐢 in
    🐢.goto(600, 200)
    🐢.penColor(ColorPalette.yellow.color)
    for _ in 1...9 {
        🐢.ray(2)
        🐢.right(160)
    }
}
