//: A UIKit based Playground for presenting user interface
import TurtleGeometry


//: # Procedures
//: Turtle geometry would be rather dull if it did not allow us to teach the turtle new commands. But luckily all we have to do to teach the turtle a new trick is to give it a list of commands it already knows. For this we are `extension` language feature to add a method to the `turtle`. For example here's how define a method `doodle` to draw the above figure. Then we can call the method `doodle` four times.
extension Turtle {
    func doodle() -> Self {
        forward(100).right(90)
        forward(100).right(90)
        forward(50).right(90)
        forward(50).right(90)
        forward(100).right(90)
        forward(25).right(90)
        forward(25).right(90)
        forward(50)
        return self
    }
}
let doodle1 = TurtleRunner().run() { 🐢 in
    for _ in 1...4 {
        🐢.doodle()
    }
}
//: Another approach to create new designs is rotating a simple doodle.
let doodle2 = TurtleRunner().run() { 🐢 in
    🐢.penColor(ColorPalette.red.color)
    for _ in 1...9 {
        🐢.doodle()
        🐢.right(10)
        🐢.forward(50)
    }
}
