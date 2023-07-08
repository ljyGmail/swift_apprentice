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
