import UIKit

// # Function basics
func printMyName() {
    print("My name is Matt Galloway.")
}

printMyName()

// ## Function parameters
func printMutipleOfFive(value: Int) {
    print("\(value) * 5 = \(value * 5)")
}

printMutipleOfFive(value: 10)

func printMultipleOf(multiplier: Int, andValue: Int) {
    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}

printMultipleOf(multiplier: 4, andValue: 2)

func printMultipleOf(multiplier: Int, and value: Int) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}

printMultipleOf(multiplier: 4, and: 2)

func printMultipleOf(_ multiplier: Int, and value: Int) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}

printMultipleOf(4, and: 2)

func printMutipleOf(_ multiplier: Int, _ value: Int) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}

printMutipleOf(4, 2)

func printMultipleOf(_ multiplier: Int, _ value: Int = 1) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}

printMultipleOf(4)

// ## Return values
/*
func multiply(_ number: Int, by multiplier: Int) -> Int {
    return number * multiplier
}

let result = multiply(4, by: 2)

func multiplyAndDivide(_ number: Int, by factor: Int)
-> (product: Int, quotient: Int) {
    return (number * factor, number / factor)
}

let results = multiplyAndDivide(4, by: 2)
let product = results.product
let quotient = results.quotient
*/

// removing "return"
func multiply(_ number: Int, by multiplier: Int) -> Int {
    number * multiplier
}

let result = multiply(4, by: 2)

func multiplyAndDivide(_ number: Int, by factor: Int)
-> (product: Int, quotient: Int) {
    (number * factor, number / factor)
}

let results = multiplyAndDivide(4, by: 2)
let product = results.product
let quotient = results.quotient

// ## Advanced parameter handling
/*
func incrementAndPrint(_ value: Int) {
    value += 1 // left side of mutating operator isn't mutable: 'value' is a 'let' constant
    print(value)
}
*/

func incrementAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}

var value = 5
incrementAndPrint(&value)
print(value)

// ## Overloading

// overload a function based on a different return type
func getValue() -> Int {
    31
}

func getValue() -> String {
    "Matt Galloway"
}

// let value = getValue()

let valueInt: Int = getValue()
let valueString: String = getValue()

// # Function as variables
func add(_ a: Int, _ b: Int) -> Int {
    a + b
}

var function = add

function(4, 2)

func subtract(_ a: Int, _ b: Int) -> Int {
    a - b
}

function = subtract
function(4, 2)

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}

printResult(add, 4, 2)

// ## The land of no return
func noReturn() -> Never {
    // Without the infinite while loop, the following error is shown:
    // global function with uninhabited return type 'Never'
    // is missing call to another never-returning function on all paths
    while true {
        
    }
}

// ## Writing good functions

// # Commenting your functions

/// Calculates the average of three values
/// - Parameters:
///     - a: The first value.
///     - b: The second value.
///     - c: The third value.
/// - Returns: The average of the three values.
func calculateAverage(of a: Double, and b: Double, and c: Double) -> Double {
    let total = a + b + c
    let average = total / 3
    return average
}

calculateAverage(of: 1, and: 3, and: 5)
