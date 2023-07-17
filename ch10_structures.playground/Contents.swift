import UIKit

// # Introducing structures
/*
let restaurantLocation = (3, 3)
let restaurantRange = 2.5

// Pyythagorean Theorem
func distance(from source: (x: Int, y: Int),
              to target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX +
            distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(localtion: (x: Int, y: Int)) -> Bool {
    let deliveryDistance = distance(from: localtion, to: restaurantLocation)
    return deliveryDistance < restaurantRange
}

isInDeliveryRange(localtion: (x: 5, y: 5)) // => false
*/

struct Location {
    let x: Int
    let y: Int
}
// after another restaurant has opened
let restaurantLocation = Location(x: 3, y: 3)
let restaurantRange = 2.5

let otherRestaurantLocation = Location(x: 8, y: 8)
let otherRestaurantRange = 2.5

// Pythagorean Theorem
/*
func distance(from source: (x: Int, y: Int),
              to target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX +
            distanceY * distanceY).squareRoot()
}
*/


func distance(from source: Location, to target: Location) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(location: Location) -> Bool {
    let deliveryDistance = distance(from: location, to: restaurantLocation)
    
    let secondDeliveryDistance = distance(from: location, to: otherRestaurantLocation)
    
    return deliveryDistance < restaurantRange ||
    secondDeliveryDistance < otherRestaurantRange
}

isInDeliveryRange(location: Location(x: 5, y: 5)) // false

// ## Your first structure

let storeLocation = Location(x: 3, y: 3)

struct DeliveryArea: CustomStringConvertible {
    let center: Location
    var radius: Double
    
    var description: String {
        """
        Area with center: (x: \(center.x), y: \(center.y))
        radius: \(radius)
        """
    }
    
    // defining a method
    func contains(_ location: Location) -> Bool {
        let distanceFromCenter =
        distance(from: center,
                 to: location)
                 
        return distanceFromCenter < radius
    }
    
    func overlaps(with area: DeliveryArea) -> Bool {
        distance(from: center, to: area.center) <=
        (radius + area.radius)
    }
    
}

var storeArea = DeliveryArea(center: storeLocation, radius: 2.5)

// # Accessing members
storeArea.radius // => 2.5

storeArea.center.x // => 3

storeArea.radius = 3.5

let fixedArea = DeliveryArea(center: storeLocation, radius: 4)

// fixedArea.radius = 3.5 // Error: Cannot assign to property

// # Introducing methods
let areas = [
    DeliveryArea(center: Location(x: 3, y: 3), radius: 2.5),
    DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)
]

func isInDeliveryRange(_ location: Location) -> Bool {
    for area in areas {
        let distanceToStore = distance(from: area.center, to: location)
        
        if distanceToStore < area.radius {
            return true
        }
    }
    return false
}

let customerLocation1 = Location(x: 5, y: 5)
let customerLocation2 = Location(x: 7, y: 7)

isInDeliveryRange(customerLocation1)
isInDeliveryRange(customerLocation2)

let area = DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)
let customerLocation = Location(x: 7, y: 7)
area.contains(customerLocation) // => true

// Structures as values
var a = 5
var b = a

a // => 5
b // => 5

a = 10

a // => 10
b // => 5

var area1 = DeliveryArea(center: Location(x: 3, y: 4), radius: 2.5)
var area2 = area1

area1.radius // => 2.5
area2.radius // => 2.5

area1.radius = 4

area1.radius // => 4
area2.radius // => 2.5

// # Structures everywhere

// # Conforming to a protocol
print(area1)
print(area2)
