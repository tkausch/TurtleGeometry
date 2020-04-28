import UIKit
import TurtleGeometry

//: # Introduction to Turtle Geometrie

//: ## Turtle Grafix
//: Imagine that you have control of a little creature called a trutle that exists in a mathematical plan or, better yet , on a computer display screen. The turtle can respond to a few simple commands: `FORWARD` moves the turtle, in the direction it is facing, some number of units. `RIGHT` rotes it in place, clockwise some number of degrees. `BACK` and `LEFT` cause the opposite movements. The number that goes with a comman to specify how much to move is called the command's input.

//: In describing the effects of these operations, we say that `FORWARD` and `BACK` change the turtle's position (the point on the plane where the turtle is located); `RIGHT` and `LEFT` change the turtle's heading ( the direction in which the turtle is facing).

//: The turtle can leave a trace of the places it has been: The position chaning commands can cuase lines to appear on the screen. This is controlled by the commands `PENUP` and `PENDOWN`. When the pen is down the turtle draws lines. The following code illustrates how you can draw on the display screen by steering the turtle with `FORWARD`, `BACK`, `RIGHT`, and `LEFT`.

let first = TurtleRunner().run() { 🐢  in
    for _ in 1...4 {
    🐢.forward(100).right(90)
    🐢.forward(100).right(90)
    🐢.forward(50).right(90)
    🐢.forward(50).right(90)
    🐢.forward(100).right(90)
    🐢.forward(25).right(90)
    🐢.forward(25).right(90)
    🐢.forward(50)
    }
}

//: The number in braces tells the turtle how many units to move or how many degrees to turn.

//: ## Procedures
//: Turtle geometry would be rather dull if it did not allow us to teach teh turtle new commands. But luckily all we have todo  to teach the turtle a new trick is to give it a list of commands it already knows. For example here's how to draw a square with sides 100 units long.

extension Turtle {
    
    func square(size) -> Self {
        
    }
    
    
    
}


