import UIKit

// # Mutable versus immutable collections

// # Arrays

// # What is an array?

// # When are arrays useful?

// # Creating arrays
let evenNumbers = [2, 4, 6, 8]

var subscribers: [String] = []

let allZero = Array(repeating: 0, count: 5)

let vowels = ["A", "E", "I", "O", "U"]

// # Creating arrays

// ## Using properties and methods
var players = ["Alice", "Bob", "Cindy", "Dan"]

print(players.isEmpty) // => false

if players.count < 2 {
    print("We need at least two players!")
} else {
    print("Let's start!")
}
// => Let's start!

var currentPlayer = players.first

print(currentPlayer as Any) // => Optional("Alice")

print(players.last as Any) // => Optional("Dan")

currentPlayer = players.min()
print(currentPlayer as Any)

print([2, 3, 1].first as Any) // => Optional(2)
print([2, 3, 1].min() as Any) // => Optional(1)

if let currentPlayer = currentPlayer {
    print("\(currentPlayer) will start") // => Alice will start
}

// ## Using subscripting
var firstPlayer = players[0]

print("First player is \(firstPlayer)")

// var player = players[4] // fatal error: Index out of range

// ## Using countable ranges to make an ArraySlice

let upcommingPlayersSlice = players[1...2]
print(upcommingPlayersSlice[1], upcommingPlayersSlice[2])

// make a brand-new, zero-indexed Array from an ArraySlice
let upcomingPlaysArray = Array(players[1...2])
print(upcomingPlaysArray[0], upcomingPlaysArray[1])

// ## Checking for an element
func isEliminated(player: String) -> Bool {
    !player.contains(player)
}

print(isEliminated(player: "Bob")) // => false

players[1...3].contains("Bob") // => true

// # Modifying arrays

// ## Appending elements
players.append("Eli")

players += ["Gina"]

print(players)

// ## Inserting elements
players.insert("Frank", at: 5)

// ## Removing elements
var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed") // => Gina was removed

removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed")

let indexOfDan = players.firstIndex(of: "Dan")
print("Index of Dan: \(indexOfDan!)")

// ## Updating elements
print(players) // => ["Alice", "Bob", "Dan", "Eli", "Frank"]

players[4] = "Franklin"
print(players) // => ["Alice", "Bob", "Dan", "Eli", "Franklin"]

players[0...1] = ["Donna", "Craig", "Brain", "Anna"]
print(players) // => ["Donna", "Craig", "Brain", "Anna", "Dan", "Eli", "Franklin"]

// ## Moving elements
let playerAnna = players.remove(at: 3)
players.insert(playerAnna, at: 0)
print(players) // => ["Anna", "Donna", "Craig", "Brain", "Dan", "Eli", "Franklin"]

players.swapAt(1, 3)
print(players) // => ["Anna", "Brain", "Craig", "Donna", "Dan", "Eli", "Franklin"]

players.sort()
print(players)

// # Iterating through an array
let scores = [2, 2, 8, 6, 1, 2, 1]

for player in players {
    print(player)
}
/*
=>
    Anna
    Brain
    Craig
    Dan
    Donna
    Eli
    Franklin
*/

for (index, player) in players.enumerated() {
    print("\(index + 1). \(player)")
}
/*
=>
    1. Anna
    2. Brain
    3. Craig
    4. Dan
    5. Donna
    6. Eli
    7. Franklin
*/

func sumOfElements(in array: [Int]) -> Int {
    var sum = 0
    for number in array {
        sum += number
    }
    return sum
}

print(sumOfElements(in: scores))

// # Running time for array operations

// # Dictionaries

// # Creating dictionaries
var namesAndScores = ["Anna": 2, "Brain": 2, "Craig": 8, "Donna": 6]
print(namesAndScores) // => ["Craig": 8, "Brain": 2, "Donna": 6, "Anna": 2]

// empty dictionary literal [:]
namesAndScores = [:]

var pairs: [String:Int] = [:]

pairs.reserveCapacity(20) // define its capacity

// # Accessing values

// ## Using subscripting
namesAndScores = ["Anna": 2, "Brain": 2, "Craig": 8, "Donna": 6] // Restore the values

print(namesAndScores["Anna"]!) // => 2

namesAndScores["Greg"] // nil

// ## Using subscripting
namesAndScores.isEmpty // => false
namesAndScores.count // => 4

// # Modifying dictionaries

// ## Adding pairs
var bobData = [
    "name": "Bob",
    "profession": "Card Player",
    "country": "USA"
]

bobData.updateValue("CA", forKey: "state")

bobData["city"] = "San Francisco" // using subscripting

// ## Updating values
bobData.updateValue("Bobby", forKey: "name") // Bob

bobData["prefession"] = "Mailman" // using subscripting

// ## Removing pairs
bobData.removeValue(forKey: "state")

bobData["city"] = nil // using subscripting

// ## Iterating through dictionaries
for (player, score) in namesAndScores {
    print("\(player) - \(score)")
}
/*
    Craig - 8
    Brain - 2
    Donna - 6
    Anna - 2
*/

for player in namesAndScores.keys {
    print("\(player), ", terminator: "") // no newline
}
// => Donna, Brain, Anna, Craig,
print("") // print one final newline

// ## Running time for dictionary operations

// # Sets

// ## Creating sets
let seOne: Set<Int> = [1]

// ## Set literals
let someArray = [1, 2, 3, 1]

var explicitSet: Set<Int> = [1, 2, 3, 1]

var someSet = Set([1, 2, 3, 1])
print(someSet) // => [1, 2, 3]

// ## Accessing elements
print(someSet.contains(1)) // => true
print(someSet.contains(4)) // => false

// ## Adding and removing elements
someSet.insert(5)

let removedElement = someSet.remove(1)
print(removedElement!) // => 1

// ## Running time for set operations
















