import UIKit
import TurtleGeometry
//: # Polygons
//: Here is one of the simples figures to draw: Go `FORWARD` some fixed amount, turn `RIGHT` some fixed amount, and repeat this sequence over and over. This procedure is called `POLY`.
extension Turtle {
    func polygon(side: Double, angle: Double) {
        for _ in 1...100 {
            forward(side)
            right(angle)
        }
    }
}
let polygon = TurtleRunner().run { 🐢 in
    🐢.goto(600, 400)
    🐢.polygon(side: 200, angle: 60)
}
let polygon = TurtleRunner().run { 🐢 in
    🐢.polygon(side: 200, angle: 60)
}

//: Polygons are a gneralization of some figures i.e. squares, triangles, stars. Spend some time exploring `POLY`, examining how the figures vary as you change the inputs. Observe that rather than drawing each figure only once, `POLY` makes the turtle retrace the same path over and over.
//: Another way to explore with
