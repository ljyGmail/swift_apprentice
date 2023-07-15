import UIKit

// # Closure basics
var multiplyClosure: (Int, Int) -> Int

multiplyClosure = { (a: Int, b: Int) -> Int in
    return a * b
}

let result = multiplyClosure(4, 2)

// # Shorthand syntax

// leave out the return keyword
multiplyClosure = { (a: Int, b: Int) -> Int in
    a * b
}

// use Swift's type inference to shorten the syntax
// even more by removing the type information
// because multiplyClosure has already been declared as taking two Ints and returning an Int
multiplyClosure = { (a, b) in
    a * b
}

// even omit the parameter list
multiplyClosure = {
    $0 * $1
}

func operateOnNumbers(_ a: Int, _ b: Int,
                      operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    print(result)
    return result
}

let addClosure = { (a: Int, b: Int) in
    a + b
}

operateOnNumbers(4, 2, operation: addClosure)

// pass in a function as the third parameter
func addFunction(_ a: Int, _ b: Int) -> Int {
    a + b
}

operateOnNumbers(4, 2, operation: addFunction)

// define
operateOnNumbers(4, 2, operation: { (a: Int, b: Int) -> Int in
    return a + b
})

// simplify the closure syntax
operateOnNumbers(4, 2, operation: { $0 + $1 })

// go a step further
operateOnNumbers(4, 2, operation: +)

// one more way to simplify the syntax
// it can only be done when the closure is the final parameter passed to a function
operateOnNumbers(4, 2) { // => trailing closure syntax
    $0 + $1
}

// ## Multiple trailing closures syntax
func sequenced(first: ()->Void, second: ()->Void) {
    first()
    second()
}

// auto-complete and press enter twice
sequenced {
    print("Hello, ", terminator: "")
} second: {
    print("world.")
}

// ## Closures with no return value
let voidClosure: () -> Void = {
    print("Swift Apprentice is awesome!")
}
voidClosure()

// ## Capturing from the enclosing scope
var counter = 0
let incrementCounter = {
    counter += 1
}

incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()

counter

func countingClosure() -> () -> Int {
    var counter = 0
    let incrementCounter: () -> Int = {
        counter += 1
        return counter
    }
    return incrementCounter
}

let counter1 = countingClosure()
let counter2 = countingClosure()

counter1() // => 1
counter2() // => 1
counter1() // => 2
counter1() // => 3
counter2() // => 2

// # Custom sorting with closures
let names = ["ZZZZZZ", "BB", "A", "CCC", "EEEEE"]
names.sorted() // => ["A", "BB", "CCC", "EEEEE", "ZZZZZZ"]

names.sorted {
    $0.count > $1.count
} // => ["ZZZZZZ", "EEEEE", "CCC", "BB", "A"]

// # Iterating over collections with closures
let values = [1, 2, 3, 4, 5, 6]
values.forEach {
    print("\($0): \($0*$0)")
}

var prices = [1.5, 10, 4.99, 2.30, 8.19]

let largePrices = prices.filter {
    $0 > 5
}

let largePrice = prices.first {
    $0 > 5
}

let salePrices = prices.map {
    $0 * 0.9
}

// map function can also be used to change the type
let userInput = ["0", "11", "haha", "42"]

let numbers1 = userInput.map {
    Int($0)
}

let numbers2 = userInput.compactMap {
    Int($0)
}

let userInputNested = [["0", "1"], ["a", "b", "c"], ["🐡"]]
let allUserInput = userInputNested.flatMap {
    $0
}

let sum = prices.reduce(0) {
    $0 + $1
}

let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
let stockSum = stock.reduce(0) {
    $0 + $1.key * Double($1.value)
}

let farmAnimals = ["🐔": 5, "🐍": 10, "🐬": 50, "🦋": 1]
let allAnimals = farmAnimals.reduce(into: []) {
    (result, this: (key: String, value: Int)) in
    for _ in 0 ..< this.value {
        result.append(this.key)
    }
}

let removeFirst = prices.dropFirst()
let removeFirstTwo = prices.dropFirst(2)

// results are as follows:
/*
removeFirst = [10, 4.99, 2.30, 8.19]
removeFirstTwo = [4.99, 2.30, 8.19]
*/

let removeLast = prices.dropLast()
let removeLastTwo = prices.dropLast(2)

// results are as follows:
/*
removeLast = [1.5, 10, 4.99, 2.30]
removeLastTwo = [1.5, 10, 4.99]
*/

let firstTwo = prices.prefix(2)
let lastTwo = prices.suffix(2)

// results are as follows:
/*
firstTwo = [1.5, 10]
lastTwo = [2.30, 8.19]
*/

prices.removeAll() {
    $0 > 2
} // prices is now [1.5]

prices.removeAll() // prices is now an empty array

// ## Lazy collections
func isPrime(_ number: Int) -> Bool {
    if number == 1 { return false }
    if number == 2 || number == 3 { return true }
    
    for i in 2...Int(Double(number).squareRoot()) {
        if number % i == 0 { return false }
    }
    
    return true
}

// imperative way
/*
var primes: [Int] = []
var i = 1
while primes.count < 10 {
    if isPrime(i) {
        primes.append(i)
    }
    i += 1
}
primes.forEach { print($0) }
*/

// lazy operation
let primes = (1...).lazy
    .filter { isPrime($0) }
    .prefix(10)
primes.forEach { print($0) }
