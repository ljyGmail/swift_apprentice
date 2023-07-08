import UIKit

// # Type conversion
var integer: Int = 100
var decimal: Double = 12.5
// integer = decimal // Cannot assign value of type 'Double' to type 'Int'

integer = Int(decimal)

// ## Operators with mixed types
let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
// let totalCost: Double = hourlyRate * hoursWorked // Cannot convert value of type 'Int' to 'Double'
let totalCost: Double = hourlyRate * Double(hoursWorked)

// ## Type inference
let typeInferredInt = 42
let typeInferredDouble = 3.14159

let wantADouble = 3

// three ways to type conversion
let actuallyDouble = Double(3)
let actuallyDouble2: Double = 3
let actuallyDouble3 = 3 as Double

let wantADouble2 = 3.0

// # Strings

// ## How computers represent strings

// ## Unicode

// # Strings in Swift

// ## Characters and strings
let characterA: Character = "a"

let characterDog: Character = "🐶"

let stringDog: String = "Dog"

let stringDog2 = "Dog"

// ## Concatenation
var message = "Hello" + " my name is "
let name = "Matt"
message += name // "Hello my name is Matt"

// add a character to a string
let exclamationMark: Character = "!"
message += String(exclamationMark) // "Hello my name is Matt!"

// ## Interpolation
message = "Hello my name is \(name)!" // "Hello my name is Matt!"

let oneThird = 1.0 / 3.0
let oneThirdLongString = "One third is \(oneThird) as a decimal."

// ## Multi-line strings
let bigString = """
    You can have a string
    that contains multiple
    lines
    by
    doing this.
    """
print(bigString)

// # Tuples
let coordinates: (Int, Int) = (2, 3)

let coordinates2 = (2, 3)

let coordinatesDoubles = (2.1, 3.5)  // Inferred to be of type (Double, Double)

let coordinatesMixed = (2.1, 3) // Inferred to be of type (Double, Int)

// access the data inside a tuple
let x1 = coordinates.0
let y1 = coordinates.1

let coordinatesNamed = (x: 2, y: 3) // Inferred to be of type (x: Int, y: Int)
let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

let coordinates3D = (x: 2, y: 3, z: 1)
let (x3, y3, z3) = coordinates3D // The code is equivalent to the following:

/*
let coordinates3D = (x: 2, y: 3, z: 1)
x3 = coordinates3D.x
y3 = coordinates3D.y
z3 = coordinates3D.z
*/

// ignore a certain element
let (x4, y4, _) = coordinates3D

// # A whole lot of number types
let a: Int16 = 12
let b: UInt8 = 255
let c: Int32 = -10000

let answer = Int(a) + Int(b) + Int(c) // answer is an Int

// # Type aliases
typealias Animal = String

let myPet: Animal = "Dog"

typealias Coordinates = (Int, Int)
let xy: Coordinates = (2, 4)

// # A peek behind the curtains: Protocols

