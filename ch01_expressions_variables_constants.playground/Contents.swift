import UIKit

// # Getting started with Swift

// ## Code comments

// This is a comment. It is not executed.

// This is also a comment.
// Over multiple lines.

/* This is also a comment.
   Over many..
   many...
   many lines. */

/* This is a comment.
    /* And inside it
    is
    another comment.
    */
Back to the first.
*/

// # Printing out
print("Hello, Swift Apprentice reader!")

// # Arithmetic operations

// ## Simple operations
2 + 6
10 - 2
2 * 4
24 / 3

// ## Decimal numbers
22 / 7

22.0 / 7.0

// ## The remainder operation
28 % 10

(28.0).truncatingRemainder(dividingBy: 10.0)

// ## Shift operations
1 << 3

32 >> 2

// ## Order of operations
((8000 / (5 * 10)) - 32) >> (29 % 5)

350 / 5 + 2
350 / (5 + 2)

// # Math functions
sin(45 * Double.pi / 180)

cos(135 * Double.pi / 180)

(2.0).squareRoot()

max(5, 10)

max(-5, -10)

max((2.0).squareRoot(), Double.pi / 2)

// # Naming data

// ## Constants
let number: Int = 10
let pi: Double = 3.14159

// number = 0 => Cannot assign to value:  'number' is a 'let' constant

// ## Variables
var variableNumber: Int = 42

variableNumber = 0
variableNumber = 1_000_000

// ## Using meaningful names

// # Increment and decrement
var counter: Int = 0

counter += 1

counter -= 1

// the code above is shorthand for the following:
counter = counter + 1

counter = counter - 1

counter = 10

counter *= 3 // same as counter = counter * 3

counter /= 2 // same as counter = counter / 2
