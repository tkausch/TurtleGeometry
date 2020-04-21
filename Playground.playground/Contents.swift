//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import TurtleGeometry

//class MyViewController : UIViewController {
//    
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//        
//        view.addSubview(label)
//        self.view = view
//    }
//}
// Present the view controller in the Live View window
// PlaygroundPage.current.liveView = MyViewController()

let size: Double  = 1000

let c = Canvas(width: size, height: size)
let turtle = Turtle(name: "Marlena")


extension Turtle {
    
    func square(_ size: Double) {
        turtle.penDown()
        for _ in 1...4 {
            forward(100)
            right(90)
        }
        turtle.penUp()
    }
    
    
    func funnyThing() {
        for _ in 1...4 {
            forward(100)
            right(90)
            forward(100)
            right(90)
            forward(50)
            right(90)
            forward(50)
            right(90)
            forward(100)
            right(90)
            forward(25)
            right(90)
            forward(25)
            right(90)
            forward(50)
        }
    }
    
}

let renderer = TurtleRenderer()

let funnyThing = renderer.image(turtle: turtle, canvas: c) { turtle in
    
    turtle.setPenColor(ColorPalette.green.color)
    turtle.penDown()
    turtle.goto(size / 2.0, size / 2.0)
    turtle.funnyThing()

}


let crazySquare = renderer.image(turtle: turtle, canvas: c) { turtle in
    
    turtle.setPenColor(ColorPalette.green.color)
    turtle.penDown()
    turtle.goto(size / 2.0, size / 2.0)
    
    for _ in 1...72 {
        turtle.turn(5)
        turtle.square(400)
    }

}



let coloredSquares = renderer.image(turtle: turtle, canvas: c) { turtle in
    
    turtle.setPenColor(ColorPalette.green.color)
    turtle.penDown()
    turtle.goto(size / 2.0, size / 2.0)
    
    for _ in 1...100 {
        turtle.randomColor()
        turtle.randomMove(70)
        turtle.square(100)
    }

}
