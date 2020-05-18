<img src="https://github.com/tkausch/TurtleGeometry/blob/master/Docs/images/Logo.png" />

[![Swift](https://img.shields.io/badge/Swift-5.1-blue.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-11.1-blue.svg)]()
[![Swift Playgrounds](https://img.shields.io/badge/Swift_Playgrounds-available-blue.svg)](https://swift.org)

This Swift framework makes it surprisingly easy to start creating amazing shapes using a turtle. It is a  [turtle graphics](https://en.wikipedia.org/wiki/Turtle_graphics)  engine written in Swift.

The commands and samples were implemented with reference to the book [Turtle Geometry](https://direct.mit.edu/books/book/4663/Turtle-GeometryThe-Computer-as-a-Medium-for). In that book you will also  find a lot of interesting  samples.


## Example Usage

```swift
// Create your own command
extension Turtle {
    func myCommand() -> Self {
    	  // Basic Commands
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

// Create image with runner
let image = TurtleRunner().run() { 🐢 in
    for _ in 1...4 {
        🐢.myCommand()
    }
}
```

### Result

<img src="https://github.com/tkausch/TurtleGeometry/blob/master/Docs/images/Sample.png" width="300" />


## Use in Playgrounds

### On Xcode

1. Open `TurtleGeometry.xcworkspace` in Xcode.
1. Build `TurtleGeometry-Package` scheme for iOS Simulator.
1. Select `Playground` in project navigator.
1. Open `Introduction.playground`in playgrounds
2. Discover more samples in [Turtle Geometry](https://direct.mit.edu/books/book/4663/Turtle-GeometryThe-Computer-as-a-Medium-for) Book


## Using with Swift-Package-Manager

To add a package dependency to your Xcode project, select ``File > Swift Packages > Add Package Dependency`` and enter this repository URL: `https://github.com/tkausch/TurtleGeometry` 

## Requirements

* Swift 5.2 (Xcode 11.4.2)
* iOS 13.0 or later


