import UIKit

struct Car {
    let make: String
    let color: String
}

// # Stored properties
/*
struct Contact {
    var fullName: String
    var emailAddress: String
}

var person = Contact(fullName: "Grace Murray", emailAddress: "grace@navy.mil")

person.fullName // => Grace Murray
person.emailAddress // => grace@navy.mil

person.fullName = "Grace Hopper"
person.fullName // => Grace Hopper
*/

// To prevent a value from changing, define a property as a contant using let:
/*
struct Contact {
    var fullName: String
    let emailAddress: String
}

// Error: cannot assign to a constant
person.emailAddress = "grace@gmail.com"
*/

// ## Default values
struct Contact {
    var fullName: String
    let emailAddress: String
    var relationship = "Friend"
}

var person = Contact(fullName: "Grace Murray", emailAddress: "grace@navy.mil")
person.relationship

var boss = Contact(fullName: "Ray Wenderlich", emailAddress: "ra@raywenderlich.com", relationship: "Boss")

// # Computed properties
struct TV {
    var height: Double
    var width: Double
    
    /*
    // read-only computed property
    // 1
    var diagonal: Int {
        // 2
        let result = (height * height +
                      width * width).squareRoot().rounded()
        // 3
        return Int(result)
    }
    */
    
    // read-write computed property
    var diagonal: Int {
        // 1
        get {
            // 2
            let result = (height * height +
                          width * width).squareRoot().rounded()
            return Int(result)
        }
        set {
            // 3
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            // 4
            let ratioDiagonal = (ratioWidth * ratioWidth +
             ratioHeight * ratioHeight).squareRoot()
            height = Double(newValue) * ratioHeight / ratioDiagonal
            width = height * ratioWidth / ratioHeight
        }
    }
}

var tv = TV(height: 53.93, width: 95.87)
tv.diagonal // => 110

tv.width = tv.height
tv.diagonal // => 76

// ## Getter and setter
tv.diagonal = 70
tv.height // => 34.32
tv.width // 61.01

// # Type properties
/*
struct Level {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)
*/

// Error: you can't access a type property on an instance
// let highestLevel = level3.highestLevel

//Level.highestLevel // => 1

// # Property observers
struct Level {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool {
        didSet {
            if unlocked && id > Self.highestLevel {
                Self.highestLevel = id
            }
        }
    }
}

// ## Limiting a variable
struct LightBulb {
    static let maxCurrent = 40
    var current = 0 {
        didSet {
            if current > LightBulb.maxCurrent {
                print("""
                    Current is too high,
                    falling back to previous setting.
                    """)
                current = oldValue
            }
        }
    }
}

var light = LightBulb()
light.current = 50
light.current // => 0
light.current = 40
light.current // => 40

// # Lazy properties
struct Circle {
    lazy var pi = {
        ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
    }()
    var radius = 0.0
    var circumference: Double {
        mutating get {
            pi * radius * 2
        }
    }
    init(radius: Double) {
        self.radius = radius
    }
}

var circle = Circle(radius: 5) // got a circle, pi has not been run

circle.circumference // => 31.42
// also, pi now has a value
