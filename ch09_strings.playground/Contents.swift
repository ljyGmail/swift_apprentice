import UIKit

// # Strings as collections
let string = "Matt"
for char in string {
    print(char)
}

let stringLength = string.count

// let fourthChar = string[3]
// 'subscript' is unavailable: catnnot subscript String with an int

// ## Grapheme clusters
let cafeNormal = "café"
let cafeCombining = "cafe\u{0301}"

cafeNormal.count // => 4
cafeCombining.count // => 4

cafeNormal.unicodeScalars.count // => 4
cafeCombining.unicodeScalars.count // => 5

for codePoint in cafeCombining.unicodeScalars {
    print(codePoint.value)
}

// ## Indexing strings
let firstIndex = cafeCombining.startIndex

let firstChar = cafeCombining[firstIndex]

// let lastIndex = cafeCombining.endIndex
// let lastChar = cafeCombining[lastIndex] // Fatal error: String index is out of bounds

let lastIndex = cafeCombining.index(before: cafeCombining.endIndex)
let lastChar = cafeCombining[lastIndex]

let fourthIndex = cafeCombining.index(cafeCombining.startIndex, offsetBy: 3)
let fourthChar = cafeCombining[fourthIndex]

fourthChar.unicodeScalars.count // => 2
fourthChar.unicodeScalars.forEach { codePoint in
    print("=> ", codePoint.value)
    
}

// ## Equality with combining characters
let equal = cafeNormal == cafeCombining // canonicalization

// # Strings as bi-directional collections
let name = "Matt"
let backwardsName = name.reversed()

let secondCharIndex = backwardsName.index(backwardsName.startIndex, offsetBy: 1)
let secondChar = backwardsName[secondCharIndex] // => "t"

let backwardsNameString = String(backwardsName)

// # Raw strings
let raw1 = #"Raw "No Escaping" \(no interpolation!). Use all the \ you want!"#

// any number of # symbols can be used as the beginning and end match like so:
let raw2 = ##"Aren't we "# clever"##

// use interpolation with raw strings
let can = "can do that too"
let raw3 = #"Yes we \#(can)!"#

// # Substrings
let fullName = "Matt Galloway"
let spaceIndex = fullName.firstIndex(of: " ")!
// let firstName = fullName[fullName.startIndex..<spaceIndex] // => Matt

// using an open-ended range
let firstName = fullName[..<spaceIndex] // => Matt

let lastName = fullName[fullName.index(after: spaceIndex)...] // => Galloway

// force Substring into a String
let lastNameString = String(lastName)

// # Character properties
let singleCharacter: Character = "x"
singleCharacter.isASCII

let space: Character = " "
space.isWhitespace

let hexDigit: Character = "d"
hexDigit.isHexDigit

let thaiNine: Character = "๙"
thaiNine.wholeNumberValue

let chineseNine: Character = "九"
chineseNine.wholeNumberValue

// # Encoding

// ## UTF-8
let char = "\u{00bd}"
print(char)
for i in char.utf8 {
    print(i)
}

let characters = "+\u{00bd}\u{21e8}\u{1f643}"
for i in characters.utf8 {
    print("\(i): \(String(i, radix: 2))")
}

// ## UTF-16
for i in characters.utf16 {
    print("=> \(i): \(String(i, radix: 2))")
}

// ## Converting indexes between encoding views
let arrowIndex = characters.firstIndex(of: "\u{21e8}")!
characters[arrowIndex] // => ⇨

if let unicodeScalarsIndex = arrowIndex.samePosition(in: characters.unicodeScalars) {
    characters.unicodeScalars[unicodeScalarsIndex] // => 8680
}

if let utf8Index = arrowIndex.samePosition(in: characters.utf8) {
    characters.utf8[utf8Index] // 226
}

if let utf16Index = arrowIndex.samePosition(in: characters.utf16) {
    characters.utf16[utf16Index] // 8680
}
