//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

let score:Int = 100

var string = "Hello How are you "
let finalString : String = string

class MyFirstClass{
    
    var firstName : String
    var lastName : String
    
    init(_ firstName : String, _ lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
}

var rajuName = MyFirstClass("raju","vaddi")
rajuName.firstName
rajuName.lastName

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)! ?? 0
convertedNumber


var serverResponseCode : Int? = 30
serverResponseCode = nil
//since we declared serverResponseCode as an Optional it will always be a optional even if you
//assign it a leteral value
serverResponseCode = Int(possibleNumber)! ?? 0 //it still is an optional
serverResponseCode = 325 //it still is an optional 
//Defining an optinal value with out any value 
var surveyError : String?
surveyError

if surveyError != nil {
    
    print ("This value is set.")
}else{
    print ("the value is not set.")
}
// setting a value to surveyError
surveyError = "Hello How are you ?"
if surveyError != nil {
    print ("This variable is set with a value: \t \(surveyError!)") // this is forced unwrapping of the optinal
}else{
    print ("the value is not set.")
}

func tellMeHowItCanBeDone(_ internalString : String) -> String {
    return "Hello you are doing good \(internalString)"
}

tellMeHowItCanBeDone("rajehsh")

class mySimpleClass{
    static func tellMeHowItCanBeDone(_ internalString : String) -> String {
        return "Hello you are doing good \(internalString)"
    }
}

mySimpleClass.tellMeHowItCanBeDone("Rajesh")

class MySimpleClass1{
    func tellMeHowItCanBeDone(_ internalString : String) -> String {
        return "Hello you are doing good \(internalString)"
    }
}

class SubClassOfMySimpleClass : MySimpleClass1{
    override func tellMeHowItCanBeDone(_ internalString: String) -> String {
        return "this is the overridden method on subclass created by \(internalString)"
        
    }
}

var subclassInstance = SubClassOfMySimpleClass()
subclassInstance.tellMeHowItCanBeDone("Rajesh")







