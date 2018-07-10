//: Playground - noun: a place where people can play

import Cocoa

//Hello world
var str = "Hello, playground"

//Stable value and variances
let numberOfStoplights: Int = 4
var population: Int

//String interpolation
//Edge of float
let y: Int8 = 120
let z = y &+ 10
print(" 120 &+ 10 is \(z)")

//Accuracy of float
let d1 = 1.1
print(" d1 + 0. 1 is \(d1 + 0.1)")
if d1 + 0.1 == 1.2 {
    print(" d1 + 0.1 is equal to 1.2")
}

//Tuple
var statusCode = 200
var errorString  = "OK"
let error = (statusCode, errorString)
error.0
error.1

//New feature: fallthrough
//Range matching
switch statusCode {
case 400...404: errorString = "There was something wrong with the request."
    fallthrough
default: errorString += " Please review the request and try again."
}

//value binding
switch statusCode {
case 100, 101: errorString += " Informational, 1xx."
errorString += "Informational, \(statusCode)."
case let unknownCode: errorString = "\(unknownCode) is not a known error code."
}

//where subphrase
let age = 25
if case 18...35 = age, age >= 21, age <= 30 {
    print(" In cool demographic and of drinking age")
}

//loop
var myFirstInt: Int = 0
for _ in 1...5 {
    myFirstInt += 1
    myFirstInt
    print(myFirstInt)
}
var i:Int = 0
for i in 1...5  {
    if i != 3 {
        print(i)
    }
}

//repeat while
repeat{
    i+=1
} while i<10

//index
var playground = "hello world"
let start = playground.startIndex
let end = playground.index(start, offsetBy: 4)
let fifthCharacter = playground[end]
let rangenew = start...end
let firstfive = playground[rangenew]

//optional value
var errorCodeString: String?
print (errorCodeString ?? "No error")

//optional binding
if let theError = errorCodeString {
    print( theError)
}

//implicitly unwrapped optional
var someString:String!
someString = "some value"

//nil coalescing operator
let description  = errorCodeString ?? "No error"

//array
var bucketList:[String] = ["Climb Mr. Bucket"]
bucketList.append("something")
bucketList.append("another one")
bucketList.append("tester")
bucketList.remove(at: 2)
print(bucketList.count)
bucketList[2] += " Jack"

//dictionary
var dict1: Dictionary< String, Double> = [:]
var dict2 = Dictionary< String, Double>()

//set
//union, intersection,
var groceryBag: Set = ["Apples", "Oranges", "Pineapple"]
for food in groceryBag {
    print( food)
}
let hasBananas = groceryBag.contains(" Bananas")
let roommatesGroceryBag = Set([" Bananas", "Cereal", "Milk", "Oranges"])
let commonGroceryBag = groceryBag.union(roommatesGroceryBag)
let itemsToReturn = commonGroceryBag.intersection(roommatesGroceryBag)
let disjoint = commonGroceryBag.isDisjoint(with: roommatesGroceryBag)

//function
func printPersonalGreeting(greeting defaultGreeting: String = "Hello", to names: String...) {
    for name in names{
        print("\(defaultGreeting) \(name), welcome to your playground.")
    }
}
printPersonalGreeting(to: "Justin")

//inout
var errorNew = "The request failed:"
func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &errorNew)

//clousure
let volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]
let volunteersSorted = volunteerCounts.sorted { $0 < $1 }

//map
let precinctPopulations = [1244, 2021, 2157]
let projectedPopulations = precinctPopulations.map {
    (population: Int) -> Int in return population * 2
}

//filter
let bigProjections = projectedPopulations.filter {
    (projection: Int) -> Bool in
    return projection > 4000 }

//reduce
let totalProjection = projectedPopulations.reduce( 0) {
    (accumulatedProjection: Int, precinctProjection: Int) -> Int in
    return accumulatedProjection + precinctProjection
}

//enum
enum TextAlignment: Int {
    case left = 20
    case right = 30
    case center = 40
}

let myRawValue = 20
if let myAlignment = TextAlignment(rawValue: myRawValue){
    print("successfully converted \(myRawValue) into a TextAlignment")
} else {
    print("\( myRawValue) has no corresponding TextAlignment case")
}

//self case
enum Lightbulb{
    case on
    case off
    
    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        switch self {
        case .on:
            return ambient + 150.0
        case .off:
            return ambient
        }
    }
}

var bulb = Lightbulb.on
let ambientTemperature = 77.0
var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print(" the bulb' s temperature is \(bulbTemperature)")

//diff function
enum ShapeDimensions {
    case point
    case square( side: Double)
    case rectangle( width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * side
        case let .rectangle( width: w, height: h):
            return w * h
        }
    }
}

var recShape = ShapeDimensions.rectangle(width: 10, height: 20)
print (recShape.area())

// recursive
enum FamilyTree {
    case noKnownParents
    indirect case oneKnownParent( name: String, ancestors: FamilyTree)
    indirect case twoKnownParents( fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}
