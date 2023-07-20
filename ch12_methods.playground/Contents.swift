import UIKit

// # Method refresher
var numbers = [1, 2, 3]
numbers.removeLast()
numbers // => [1, 2]

// ## Comparing methods to computed properties

// ## Turinging a function to a method
let months = ["January", "February", "March",
                "April", "May", "June",
                "July", "August", "September",
                "October", "November", "December"
]

/*
struct SimpleDate {
    var month: String
}

func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
    months.firstIndex(of: "December")! -
    months.firstIndex(of: date.month)!
}
*/

// convert monthsUntilWinterBreak(date:) into a method
struct SimpleDate {
    var month = "January"
    var day = 1
    
    /*
    init() {
        month = "January"
        day = 1
    }
    
    init(month: String, day: Int) {
        self.month = month
        self.day = day
    }
    */
    
    /*
    func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
        months.firstIndex(of: "December")! -
        months.firstIndex(of: date.month)!
    }
    */
    
    // 1
    func monthsUntilWinterBreak() -> Int {
        // 2
        // months.firstIndex(of: "December")! -
        // months.firstIndex(of: self.month)!
        
        // More consice way is to remove "self"
        months.firstIndex(of: "December")! -
        months.firstIndex(of: month)!
    }
    
    mutating func advance() {
        day += 1
    }
}

//let date = SimpleDate(month: "October")
//date.monthsUntilWinterBreak(from: date) // => 2

// date.monthsUntilWinterBreak() // Error!

// # Introducing self
//date.monthsUntilWinterBreak() // => 2

// # Introducing initializers

let newYearsDay = SimpleDate()
newYearsDay.month // => January
newYearsDay.monthsUntilWinterBreak() // => 11

// ## Initializers in structures
let valentnesDay = SimpleDate(month: "February", day: 14)

valentnesDay.month // => February
valentnesDay.day // => 14

// ## Default values and initializers

// Mix and match
let octoberFirst = SimpleDate(month: "October")
octoberFirst.month // => October
octoberFirst.day // => 1

let januaryTwentySecond = SimpleDate(day: 22)
januaryTwentySecond.month // => January
januaryTwentySecond.day // => 22

// # Introducing mutating methods

// # Type methods
struct Math {
    // 1
    static func factorial(of number: Int) -> Int {
        // 2
        (1...number).reduce(1, *)
    }
}

// 3
Math.factorial(of: 6) // => 720

// # Adding to an existing structure with extensions
extension Math {
    static func primeFactors(of value: Int) -> [Int] {
        // 1
        var remainingValue = value
        // 2
        var testFactor = 2
        var primes: [Int] = []
        // 3
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            }
            else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
}

Math.primeFactors(of: 81) // => [3, 3, 3, 3]

// ## Keeping the compiler-generated initializer using extensions
struct SimpleDate2 {
    var month = "January"
    var day = 1
    
    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! -
        months.firstIndex(of: month)!
    }
    
    mutating func advance() {
        day += 1
    }
}

extension SimpleDate2 {
    init(month: Int, day: Int) {
        self.month = months[month-1]
        self.day = day
    }
}

let halloween = SimpleDate2(month: 10, day: 31)
halloween.month // => October
halloween.day // => 31
