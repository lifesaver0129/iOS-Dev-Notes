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


