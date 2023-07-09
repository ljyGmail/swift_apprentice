import UIKit

// # Comparison operators
let yes: Bool = true
let no: Bool = false

// type inference
let yes2 = true
let no2 = false

// ## Boolean operators
let doesOneEqualTwo = (1 == 2)

let doesOneNotEqualwo = (1 != 2)

let alsoTrue = !(1 == 2)

let isOneGreaterThanTwo = (1 > 2)
let isOneLessThanTwo = (1 < 2)

// ## Boolean logic
let and = true && true

let or = true || false

let andTrue = 1 < 2 && 4 > 3
let andFalse = 1 < 2 && 3 > 4

let orTrue = 1 < 2 || 3 > 4
let orFalse = 1 == 2 || 3 == 4

let andOr = (1 < 2 && 3 > 4) || 1 < 4

// ## String equality
let guess = "dog"
let dogEqualsCat = guess == "cat"

let order = "cat" < "dog"

// ## Toggle a Bool
var switchState = true
switchState.toggle() // switchState = false
switchState.toggle() // switchState = true
