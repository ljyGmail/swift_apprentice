import UIKit

// # Introducing inheritance
struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

/*
class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
} */

/*
class Student: Person {
    var grades: [Grade] = []
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

let john = Person(firstName: "Johhny", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")

john.firstName // => Johnny
jane.firstName // => Jane

let history = Grade(letter: "B", points: 9.0, credits: 3.0)
jane.recordGrade(history)
// john.recordGrade(history) // john is not a student

class BandMember: Student {
    var minimumPracticeTime = 2
}

class OboePlayer: BandMember {
    // This is an example of an override, which we'll cover soon.
    override var minimumPracticeTime: Int {
        get {
            super.minimumPracticeTime * 2
        }
        set {
            super.minimumPracticeTime = newValue / 2
        }
    }
}

// ## Polymorphism
func phonebookName(_ person: Person) -> String {
    "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "Johnny", lastName: "Appleseed")
let oboePlayer = OboePlayer(firstName: "Jane", lastName: "Appleseed")

phonebookName(person) // => Appleseed, Johnny
phonebookName(oboePlayer) // => Appleseed, Jane

// ## Runtime hierarchy checks
var hallMonitor = Student(firstName: "Jill", lastName: "Bananapeel")

hallMonitor = oboePlayer

oboePlayer as Student
// (oboePlayer as Student).minimumPracticeTime // ERROR: No longer a band member!

hallMonitor as? BandMember
(hallMonitor as? BandMember)?.minimumPracticeTime // 4
// (optional)

hallMonitor as! BandMember // Careful! Failure would lead to a runtime crash.
(hallMonitor as! BandMember).minimumPracticeTime // 4 (force unwrapped)

if let hallMonitor = hallMonitor as? BandMember {
    print("This hall monitor is a band member and practices at least \(hallMonitor.minimumPracticeTime) hours per week")
}

func afterClassActivity(for student: Student) -> String {
    "Goes home!"
}

func afterClassActivity(for student: BandMember) -> String {
    "Goes to practice!"
}

afterClassActivity(for: oboePlayer) // => Goes to practice!
afterClassActivity(for: oboePlayer as Student) // Goes home!

// ## Inheritance, methods and overrides
class StudentAthlete: Student {
    var failedClasses: [Grade] = []
    
    override func recordGrade(_ grade: Grade) {
        super.recordGrade(grade)
        
        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }
    
    /*
     override func recordGrade(_ grade: Grade) {
        var newFailedClasses: [Grade] = []
        for grade in grades {
            if grade.letter == "F" {
                newFailedClasses.append(grade)
             }
         }
        failedClasses = newFailedClasses
     
        super.recordGrade(grade)
     }
     // Bug: if the new grade.letter is an F, the code
     won't update failedClasses properly
     It's best practice to call the super version of a
     method first when overriding.
     */
    
    var isEligible: Bool {
        failedClasses.count < 3
    }
}

// ## Introducing super

// ## When to call super

// ## Preventing inheritance
final class FinalStudent: Person {}
// class FinalStudentAthlete: FinalStudent {} // Build error!

class AnotherStudent: Person {
    final func recordGrade(_ grade: Grade) {}
}

class AnotherStudentAthlete: AnotherStudent {
    // override func recordGrade(_ grade: Grade) {} // Build error!
}

// # Inheritance and class initialization
class NewStudent: Person {
    var grades: [Grade] = []
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

class NewStudentAthlete: NewStudent {
    var sports: [String]
    var failedClasses: [Grade] = []
    
    init(firstName: String, lastName: String, sports: [String]) {
        self.sports = sports
        // Build error - super.init isn't called before
        // returning from initializer
        // Add the following super.init() call
        super.init(firstName: firstName, lastName: lastName)
    }
    
    override func recordGrade(_ grade: Grade) {
        super.recordGrade(grade)
        
        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }
    
    var isEligible: Bool {
        failedClasses.count < 3
    }
}

// ## Two-phase initialization
// Here's StudentAthlete class again, with athletes automatically getting a starter grade
class NewStudentAthlte2: NewStudent {
    var sports: [String]
    var failedClasses: [Grade] = []
    
    init(firstName: String, lastName: String, sports: [String]) {
        // 1
        self.sports = sports
        // 2
        let passGrade = Grade(letter: "P", points: 0.0, credits: 0.0)
        // 3
        super.init(firstName: firstName, lastName: lastName)
        // 4
        recordGrade(passGrade)
    }
    
    override func recordGrade(_ grade: Grade) {
        super.recordGrade(grade)
        
        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }
    
    var isEligible: Bool {
        failedClasses.count < 3
    }
}
*/

// ## Required and convenience initializers
class Student {
    let firstName: String
    let lastName: String
    var grades: [Grade] = []
    
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    convenience init(transfer: Student) {
        // self.firstName = transfer.firstName
        // self.lastName = transfer.lastName
        self.init(firstName: transfer.firstName, lastName: transfer.lastName)
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

class StudentAthlete: Student {
    var sports: [String]
    var failedClasses: [Grade] = []
    
    // Now required by the compiler
    required init(firstName: String, lastName: String) {
        self.sports = []
        super.init(firstName: firstName, lastName: lastName)
    }
    
    var isEligible: Bool {
        failedClasses.count < 3
    }
}

// ## When and why to subclass

// ## Adhering to the single responsiblity principle

// ## Leveraging strong types
class Team {
    var players: [StudentAthlete] = []
    
    var isEligible: Bool {
        for player in players {
            if !player.isEligible {
                return false
            }
        }
        return true
    }
}

// ## Shared base classes
// A button that can be pressed.
class Button {
    func press() {}
}

// An image that can be rendered on a button
class Image {}

// A button that is composed entirely of an image.
class ImageButton: Button {
    var image: Image
    
    init(image: Image) {
        self.image = image
    }
}

// A button that renders as text.
class TextButton: Button {
    var text: String
    
    init(text: String) {
        self.text  = text
    }
}

// ## Extensibility

// ## Identity

// # Understanding the class lifecycle
var someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Person object has a reference count of 1 (someone variable)

var anotherSomeone: Person? = someone
// Reference count 2 (someone, anotherSomeone)

var lotsOfPeople = [someone, someone, anotherSomeone, someone]
// Reference count 6 (someone, anotherSomeone, 4 references in lotsOfPeople)

anotherSomeone = nil
// Reference count 5 (some, 4 references in lotsOfPeople)

lotsOfPeople = []
// Reference count 1 (someone)

someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Reference count 0 for the original Person object!
// Variable someone now references a new object

// ## Deinitialization
class PersonDeinit {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        print("\(firstName) \(lastName) is being removed from memory!")
    }
}

var personDeinit: PersonDeinit? = PersonDeinit(firstName: "ZhiShen", lastName: "Lu")

personDeinit = nil

// ## Retain cycles and weak references
class StudentDeinit: PersonDeinit {
    weak var partner: StudentDeinit?
    
    deinit {
        print("\(firstName) is being deallocated!")
    }
}

var alice: StudentDeinit? = StudentDeinit(firstName: "Alice", lastName: "Appleseed")
var bob: StudentDeinit? = StudentDeinit(firstName: "Bob", lastName: "Appleseed")

alice?.partner = bob
bob?.partner = alice

alice = nil
bob = nil































