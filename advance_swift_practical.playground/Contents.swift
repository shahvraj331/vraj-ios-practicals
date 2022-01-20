import UIKit

    /*  Class  */

//Q - 1: Create a swift program to demonstrate swift class. Which has two variables inside class body.
//Access (Set its values and get its value.) these variables by creating one instance of class.
class ArrayProperties {
    var minValue = 0
    var maxValue = 0
}

let inputArray = [5, 10, 7, 25, 1]
let givenArray = ArrayProperties()
if let minValue = inputArray.min() {
    givenArray.minValue = minValue
}
if let maxValue = inputArray.max() {
    givenArray.maxValue = maxValue
}
print("Input array: \(inputArray), min value: \(givenArray.minValue), max value: \(givenArray.maxValue)\n")

//Q - 2: Create a swift program to demonstrate usage of swift class for usage of multiple initializers.
//Create one initializer with two parameters your name and college and another initializer with your name and department.
//You can be able to access these properties using instance of class.
class Employee {
    var nameOfEmployee: String
    var collegeOfEmployee = ""
    var departmentOfEmployee = ""
    
    init (name: String, college: String) {
        nameOfEmployee = name
        collegeOfEmployee = college
    }
    
    init (name: String, department: String) {
        nameOfEmployee = name
        departmentOfEmployee = department
    }
}

var newEmployee = Employee(name: "Vraj", college: "Changa")
print("Name: \(newEmployee.nameOfEmployee), College: \(newEmployee.collegeOfEmployee), ",terminator: "")
newEmployee = Employee(name: "Vraj", department: "CE")
print("Department: \(newEmployee.departmentOfEmployee)\n")

//Q - 3: Create a swift class without initializers and access (write, read) its properties using instance of class.
class WithoutInitializerExample {
    var firstParameter = 0
    var secondParameter = 0
}

let withoutInitializerObject = WithoutInitializerExample()
withoutInitializerObject.firstParameter = 150
withoutInitializerObject.secondParameter = 250
print("First parameter: \(withoutInitializerObject.firstParameter), Second parameter: \(withoutInitializerObject.secondParameter)\n")

//Q - 4: Create a swift class which is having code to return square of given number and access this code using class instance.
class GetSquare {
    var inputNumber = 0
    var squareOfGivenNo: Int {
        return inputNumber * inputNumber
    }
}

let squareOfANumber = GetSquare()
squareOfANumber.inputNumber = 9
print("Square of \(squareOfANumber.inputNumber) is \(squareOfANumber.squareOfGivenNo)\n")

//Q - 5: Create a swift class example to show use of swift inheritance. Your base class has some property.
//Access this property in two different child classes and show its usage using the instances of both child classes.
class Animal {
    var heightOfAnimal: Int
    
    init (height: Int) {
        heightOfAnimal = height
    }
}
class WildAnimal: Animal {
    var nameOfAnimal = ""
}
class PetAnimal: Animal {
    var nameOfAnimal = ""
}

let wildAnimalObject = WildAnimal(height: 10)
wildAnimalObject.nameOfAnimal = "Tiger"
let petAnimalObject = PetAnimal(height: 4)
petAnimalObject.nameOfAnimal = "Cat"
print("Wild animal name: \(wildAnimalObject.nameOfAnimal), height: \(wildAnimalObject.heightOfAnimal)")
print("Pet animal name: \(petAnimalObject.nameOfAnimal), height: \(petAnimalObject.heightOfAnimal)\n")

//Q - 6: Create a swift class example to show use of swift base class which have some implementation inside any method.
//Now demonstrate usage of overriding that method implementation.
class ParentClass {
    func displayMessage() {
        print("Inside parent class")
    }
}
class ChildClass: ParentClass {
    override func displayMessage() {
        print("Inside child class")
    }
}

let parentClassObject = ParentClass()
let childClassObject = ChildClass()
parentClassObject.displayMessage()
childClassObject.displayMessage()
print()

//Q - 7: Create a swift class with an initializer in a manner that you can create this class using initializing value.
//And one function which takes int input and returns the power of class variable.
class InitializerExample {
    let inputNumber: Double
    
    init (inputNumber: Double) {
        self.inputNumber = inputNumber
    }
    
    func getPower(power: Double) -> Int {
        return Int(pow(self.inputNumber, power))
    }
}

let initializerObject = InitializerExample(inputNumber: 5)
let powerOfInputNumber: Double = 3
print("\(initializerObject.inputNumber) power \(powerOfInputNumber) is \(initializerObject.getPower(power: powerOfInputNumber))\n")

//Q - 8: Create a swift class example which has a parent class for vehicles, and child classes for two different vehicles e.g. (bike & car).
//You need to use common properties and method in the parent class and inside child class, there will be some different property which is not common.
class Vehicle {
    var currentSpeed: Double
    var isInsured: Bool
    
    init (speed: Double, isInsured: Bool) {
        currentSpeed = speed
        self.isInsured = isInsured
    }
    
    func displayMessage() { }
}
class Bike: Vehicle {
    var fuelTankStatus: String
    
    init (speedOfBike: Double, isBikeInsured: Bool, fuelTankStatus: String) {
        self.fuelTankStatus = fuelTankStatus
        super.init(speed: speedOfBike, isInsured: isBikeInsured)
    }
    
    override func displayMessage() {
        print("Bike is traveling with \(super.currentSpeed) km/h. Bike is \(super.isInsured ? "insured": "not insured"). ", terminator: "")
        print("Fuel tank status: \(fuelTankStatus)")
    }
}
class Car: Vehicle {
    var noOfDoors: Int
    
    init (speedOfCar: Double, isCarInsured: Bool, noOfDoors: Int) {
        self.noOfDoors = noOfDoors
        super.init(speed: speedOfCar, isInsured: isCarInsured)
    }
    
    override func displayMessage() {
        print("Car is traveling with \(super.currentSpeed) km/h. Car is \(super.isInsured ? "insured": "not insured"). ", terminator: "")
        print("Number of doors: \(noOfDoors)")
    }
}

let bikeObject = Bike(speedOfBike: 45, isBikeInsured: true, fuelTankStatus: "half filled")
let carObject = Car(speedOfCar: 32, isCarInsured: false, noOfDoors: 4)
bikeObject.displayMessage()
carObject.displayMessage()
print()

//Q - 9: Create a person swift class with person name initializer and create one function to greet that person.
class Person {
    let nameOfPerson: String
    
    init (nameOfPerson: String) {
        self.nameOfPerson = nameOfPerson
    }
    
    func displayGreetMessage() {
        print("Welcome \(nameOfPerson)")
    }
}

let personObject = Person(nameOfPerson: "Vraj Shah")
personObject.displayGreetMessage()
print()

//Q - 10: Create a swift class with some property. And then set its value using initializer of class, then perform below actions.
//let example1 = Example()
//Example1.a = “Hello”
//let example2 = example1
//example2.a = “Hi”
//print(example1.a)
//print(example2.a)
//Check these two print outputs and try to find out the reason for that output.
class SomeClass {
    var greetMessage = ""
}

let objectOne = SomeClass()
objectOne.greetMessage = "Hello"
let objectTwo = objectOne
objectTwo.greetMessage = "Hi"
//as class instances are always passed by reference, change in objectTwo gets reflected in objectOne also.
print("First object greet message: \(objectOne.greetMessage), second object greet message: \(objectTwo.greetMessage)\n")

    /*  Structures  */

//Q - 1: Create one structure of type Work, which have some properties like work location, work hours and one string array of project names.
//Create a function inside structure which returns all project names for the person.
struct Work {
    var workLocation: String
    var workHours: Int
    var projectNames: [String]
    
    func getProjectNames() {
        print(projectNames)
    }
}

let projectArray = ["Universal Student Bridge", "Image Steganography", "Restaurant Management", "Branch Module"]
let firstPerson = Work(workLocation: "Ahmedabad", workHours: 115, projectNames: projectArray)
firstPerson.getProjectNames()
print()

//Q - 2: Create a structure example which demonstrates use of initializer in structures.
struct Cuboid {
    var width: Double
    var height: Double
    
    init (width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

let cuboidObject = Cuboid(width: 14.64, height: 18.12)
print("\(cuboidObject)\n")

//Q - 3: Create a structure program which can be initialized with parameters and it also should be able to initialized without parameters
//Taking above struct for this question also
struct AnotherCuboid {
    var width = 0.0
    var height = 0.0
}
let firstCuboidObject = AnotherCuboid(width: 10.0, height: 20.0)
var secondCuboidObject = AnotherCuboid()
secondCuboidObject.width = 20.0
secondCuboidObject.height = 10.0
print("First cuboid: \(firstCuboidObject), second cuboid: \(secondCuboidObject)\n")

//Q - 4: Create one structure which have initializer which takes array of int as input returns  two arrays one of all even numbers and another is all odd numbers
struct GetEvenAndOddNumbers {
    var inputArray: [Int]
    
    init (inputArray: [Int]) {
        self.inputArray = inputArray
    }
    
    var evenArray: [Int] {
        return inputArray.filter { $0 % 2 == 0 }
    }
    var oddArray: [Int] {
        return inputArray.filter { $0 % 2 != 0 }
    }
}

var someIntArray = [1, 3, 5, 6, 8, 10, 9, 7, 8, 12]
var getEvenAndOddNumbersObject = GetEvenAndOddNumbers(inputArray: someIntArray)
print("Even array: \(getEvenAndOddNumbersObject.evenArray)")
print("Odd array: \(getEvenAndOddNumbersObject.oddArray)\n")

//Q - 5: Create one swift structure program for person that contains basic details like name, age, gender. Then create one array of person with all details.
//Print all details of that array. Its size can be vary.
struct PersonStruct {
    var nameOfPerson: String
    var ageOfPerson: Int
    var genderOfPerson: String
}

var personArray: [PersonStruct] = []
personArray.append(PersonStruct(nameOfPerson: "Vraj", ageOfPerson: 21, genderOfPerson: "Male"))
personArray.append(PersonStruct(nameOfPerson: "Nishchay", ageOfPerson: 21, genderOfPerson: "Male"))
personArray.append(PersonStruct(nameOfPerson: "Krishna", ageOfPerson: 20, genderOfPerson: "Female"))
personArray.append(PersonStruct(nameOfPerson: "Ashrut", ageOfPerson: 21, genderOfPerson: "Male"))
personArray.append(PersonStruct(nameOfPerson: "Maitri", ageOfPerson: 20, genderOfPerson: "Female"))

for person in personArray {
    print("Name: \(person.nameOfPerson), Gender: \(person.genderOfPerson), Age: \(person.ageOfPerson)")
}
print()

//Q - 6: Perform same example given in class question no 10 and check output using structure.
//Try to find difference between these two outputs and try to figure out the reason for that
//taking above structure PersonStruct as a structure for this particular question
var firstPersonObject = PersonStruct(nameOfPerson: "Vraj", ageOfPerson: 21, genderOfPerson: "Male")
var secondPersonObject = firstPersonObject
secondPersonObject.nameOfPerson = "Ashrut"
//In this case the value of first object is not changed because, instance of struct is always passed by value i.e. copy of the instance
print("First object: \(firstPersonObject)\nSecond object: \(secondPersonObject)\n")

//Q - 7: Try to figure out basic difference between class and structures and give a demo for same

//1st difference is that, class instances are always passed by reference and struct instances are always passed by values.
//Example for same is already given above in Class Q-10 and Struct Q-6.

//Inheritance is possible in Class while it is not possible in struct.
//Example for class inheritance is given in Class Q-5.

//Type casting is possible in Class while it is not possible in struct.
//refer Class Q-8 for vehicle, bike and car class.
var groups: [Any] = []
groups.append(Bike(speedOfBike: 56, isBikeInsured: false, fuelTankStatus: "Full"))
groups.append(Car(speedOfCar: 78, isCarInsured: true, noOfDoors: 4))

for (index, object) in groups.enumerated() {
    switch object {
    case _ as Bike:
        print("Index: \(index), Bike object")
    case _ as Car:
        print("Index: \(index), Car object")
    default:
        print("Cannot identify")
    }
}
print()

//Deinitialization is only possible in class
var givenInteger = 0
class DeinitializationExample {
    init (givenInt: Int) {
        givenInteger = givenInt
    }
    deinit {
        givenInteger = -1
    }
}
var deinitializationObject: DeinitializationExample? = DeinitializationExample(givenInt: 10)
print("Initial value: \(givenInteger)")
deinitializationObject = nil
print("After deinitialization of object, value changes to \(givenInteger)\n")

    /*  Enumerations  */

//Q - 1: Write swift program using enumerations to check week day from given number. Consider Monday as 1 and Sunday as 7.
//Example. It should return Monday or mon if I pass parameter 1 for get day name
enum DaysInAWeek: Int {
    case Monday = 1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}
let getDayName = 1
if let currentDay = DaysInAWeek(rawValue: getDayName) {
    print("Current day: \(currentDay)\n")
} else {
    print("Cannot find day!\n")
}

//Q - 2: Create one enumeration program to return number of days in a month
enum DaysInAMonth {
    case January, February, March, April, May, June, July, August, September, October, November, December
    var noOfDays: String {
        switch self {
        case .January, .March, .May, .July, .August, .October, .December:
            return "\(self) has 31 days"
        case .February:
            return "\(self) has 28 days"
        default:
            return "\(self) has 30 days"
        }
    }
}
let currentMonth = DaysInAMonth.April
print("\(currentMonth.noOfDays)\n")

//Q - 3: Write a swift program using enumerations to demonstrate Int enums
enum IntEnum: Int {
    case Zero = 0, One, Two, Three, Four, Five, Six, Seven, Eight, Nine
    var getStringOfDigit: String {
        switch self {
        case .Zero:
            return "Zero"
        case .One:
            return "One"
        case .Two:
            return "Two"
        case .Three:
            return "Three"
        case .Four:
            return "Four"
        case .Five:
            return "Five"
        case .Six:
            return "Six"
        case .Seven:
            return "Seven"
        case .Eight:
            return "Eight"
        case .Nine:
            return "Nine"
        }
    }
}
let inputNumber = 145098
var charArrayOfNumber = [Character](String(inputNumber))
var finalDigitString = ""
primeCondition: if !charArrayOfNumber.isEmpty {
    print(inputNumber, terminator: " ")
    repeat{
        if let currentDigit = charArrayOfNumber.first?.wholeNumberValue {
            if let currentDigitString = IntEnum(rawValue: currentDigit) {
                finalDigitString += currentDigitString.getStringOfDigit
            }
        } else {
            print(" is NOT A NUMBER!")
            break primeCondition
        }
        charArrayOfNumber.removeFirst()
    } while(!charArrayOfNumber.isEmpty)
    print("\(finalDigitString)\n")
} else {
    print("Enter some number!")
}

//Q - 4: Write a swift program to demonstrate string type enum
enum CompassPoint: String {
    case North, South, East, West
}

var currentDirection = CompassPoint.North
print("Current direction: \(currentDirection.rawValue)")
currentDirection = CompassPoint.South
print("New direction: \(currentDirection.rawValue)\n")

//Q - 5: Write a swift program for enum with raw values
enum RawValueExample: Double {
    case pi = 3.14
    case euler = 2.71
    case rootTwo = 1.41
}
print("Value of pie is \(RawValueExample.pi.rawValue)")
print("Value of 2 * (euler) is \(RawValueExample.euler.rawValue * 2)\n")

//Q - 6: Write a swift program using enumerations to get all cases as an array with use of CaseIterable(Optional) and without use of CaseIterable(Mandatory)
enum Direction: String, CaseIterable {
    case left
    case right
    case up
    case down
    static var allCasesArray = [Direction.left.rawValue, Direction.right.rawValue, Direction.up.rawValue, Direction.down.rawValue]
}
var arrayOfDirectionCases: [String] = []
for direction in Direction.allCases {
    arrayOfDirectionCases.append(direction.rawValue)
}
print("With CaseIterable: \(arrayOfDirectionCases)")
print("Without CaseIterable: \(Direction.allCasesArray)\n")

//Q - 7: Write a swift program using enumerations for learn and demonsrate enum cases with parameters (Enum with associated values)
enum Distance {
    case km(Double, String)
    case miles(Double, String)
    var displaySpeed: String {
        switch self {
        case .km(let dist, let type):
            return "\(dist) \(type)"
        case .miles(let dist, let type):
            return "\(dist) \(type)"
        }
    }
}
var distanceInKm = Distance.km(25, "KM")
var distanceInMiles = Distance.miles(15.5, "Miles")
print("Distance in Kilometers: \(distanceInKm.displaySpeed)")
print("Distance in Miles: \(distanceInMiles.displaySpeed)\n")

//Q - 8: Create an enum with its rawValues of type String and show usage of case to print value of case
enum StringValueExample: String {
    case hello = "Hello World!"
    case play = "The user is playing"
    case travel = "The user is travelling"
}
print("Enum case hello: \(StringValueExample.hello.rawValue)")
print("Enum case play: \(StringValueExample.play.rawValue)")
print("Enum case travel: \(StringValueExample.travel.rawValue)\n")

    /*  Property, Subscripts, Methods and Inheritance  */

//Q - 1: Create an example using swift to demonstrate use of get only properties. Create a class with a property which value cannot be set outside of class
//Output: for example, your class Demo has one property of string type then you can be able to set it within a class. If I try set it outside of class it must give an error
class ReadOnlyVarExample {
    private(set) var givenName: String
    
    init (givenName: String) {
        self.givenName = givenName
    }
    func updateName(newName: String) {
        givenName = newName
    }
}

var readOnlyVarObject = ReadOnlyVarExample(givenName: "VRAA")
//readOnlyVarObject.givenName = "VRAJ"        //ERROR: Cannot assign to property: 'givenName' setter is inaccessible
readOnlyVarObject.updateName(newName: "VRAJ")
print("\(readOnlyVarObject.givenName)\n")

//Q - 2: Create a swift program to demonstrate usage of computed properties using getter and setter
class Sample {
    var width = 100.0, height = 200.0

    var center: (Double, Double) {
        get {
            return (width / 2, height / 2)
        }
        //set(newVariable) is used when we want to use custom name for new variable
        set {
            width = newValue.0 - (width / 2)
            height = newValue.1 - (height / 2)
        }
    }
}

var sampleResult = Sample()
print("Initial value for center: \(sampleResult.center)")
sampleResult.center = (150.0, 150.0)
print("Width: \(sampleResult.width), Height: \(sampleResult.height)\n")

//Q - 3: Create a swift program to show usage of stored properties
struct StoredPropExample {
    var firstParam: String
    var secondParam: String
}
var storedPropObject = StoredPropExample(firstParam: "Hello", secondParam: "World!")
print("First parameter: \(storedPropObject.firstParam), Second parameter: \(storedPropObject.secondParam)\n")

//Q - 4: Create a swift program which has private properties which cannot directly be accessed. Means we cannot directly read or write it
class PrivateVarExample {
    private var privateVariable = "ABCD"
    
    func updateValue(newString: String) -> String {
        privateVariable = newString
        return privateVariable
    }
}
var privateVarObject = PrivateVarExample()
//privateVarObject.privateVariable = "abcd"            //'privateVariable' is inaccessible due to 'private' protection level
//print(privateVarObject.privateVariable)              //'privateVariable' is inaccessible due to 'private' protection level
print("\(privateVarObject.updateValue(newString: "Hello"))\n")

//Q - 5: Create one swift class which have two properties name and id, the class must have one initializer to set that properties.
//And create one array of that class types
class PersonInIndia {
    var nameOfPerson: String
    var idOfPerson: Int
    
    init (name: String, id: Int) {
        nameOfPerson = name
        idOfPerson = id
    }
}
var allPersonArray: [PersonInIndia] = []
allPersonArray.append(PersonInIndia(name: "Vraj", id: 123))
allPersonArray.append(PersonInIndia(name: "Ashrut", id: 132))
allPersonArray.append(PersonInIndia(name: "Aryan", id: 139))

for person in allPersonArray {
    print("ID: \(person.idOfPerson), Name: \(person.nameOfPerson)")
}
print()

//Q - 6: Create one example of usage of willSet and didSet
//willSet is called just before the value is stored and didSet is called immediately after the new value is stored.
class WillSetAndDidSetExample {
    var counter: Int = 0 {
        willSet (newTotal) {
            print("Total Counter is: \(newTotal)")
        }
        didSet {
            if counter > oldValue {
                print("Moved \(counter - oldValue) times")
            } else {
                print("Moved \(oldValue - counter) steps back")
            }
        }
    }
}
let newCounter = WillSetAndDidSetExample()
newCounter.counter = 100
newCounter.counter = 250
newCounter.counter = 200
print()

//Q - 7: Create one lazy stored property in a class and show usage of it
class LazyStoredPropExample {
    var greeting = "HELLO"
}
class performAction {
    lazy var lazyStoredPropExampleObject = LazyStoredPropExample()
}

let performActionObject = performAction()
print("\(performActionObject.lazyStoredPropExampleObject.greeting)\n")

//Q - 8: Create one class as Base type Person which has common properties like name, occupation, etc. Create two child classes from the person
//which are Student and Employee and this two-child classes must have base properties and some other properties also.
//Example, student have college, but Employee have company. And demonstrate the usage of inheritance

//Implementation for this problem is already given in Classes Q-8.

//Q - 9: Create one structure to show usage of mutating function in swift
struct MutatingStructExample {
    var firstParam: Int
    
    mutating func updateFirstParam(newInt: Int) {
        self.firstParam = newInt
    }
}

var mutatingStructObject = MutatingStructExample(firstParam: 150)
mutatingStructObject.updateFirstParam(newInt: 250)
print("Updated value using mutating function: \(mutatingStructObject.firstParam)\n")

//Q - 10: Create one class inheritance demo to show usage of method overriding

//Implementation for this problem is already given in Classes Q-8.

//Q - 11: Create one swift class to show usage of type methods
class TypeMethodsExample {
    class func displayMessage() {
        print("Class method called")
    }
    static func anotherDisplayMessage() {
        print("Static method called")
    }
}
TypeMethodsExample.displayMessage()
TypeMethodsExample.anotherDisplayMessage()
print()

//Q - 12: Create one swift class which is having class method and static method. Then in one child class try to override that methods and check the output/ error.
class ChildClassOfTypeMethod: TypeMethodsExample {
    override class func displayMessage() {
        print("Class method called inside child class")
    }
    //override static func anotherDisplayMessage() {}     //Cannot override static method
}
ChildClassOfTypeMethod.displayMessage()
print()

//Q - 13: Create one example of subscript using array. Create one array of weekdays and one subscript func which takes int as argument and returns day of week
//Uutput: WeekDays.subscript(day: 1) // will return Sunday Note: Handle invalid input
class GetWeekDay {
    var weekDays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    subscript(index: Int) -> String? {
        if index <= weekDays.count {
            return weekDays[index - 1]
        } else {
            return nil
        }
    }
}
var currentDay = GetWeekDay()
var inputDay = 1
if let day = currentDay[inputDay] {
    print("Current day: \(day)\n")
} else {
    print("Array index out of bounds\n")
}

//Q - 14: Create a swift program to show usage of subscript in string. I pass int argument and it returns the character at given position
class SubscriptExample {
    var myString = "Hello World!"
    subscript(index: Int) -> Character? {
        if index <= myString.count {
            let charArrayOfMyString = [Character](myString)
            return charArrayOfMyString[index - 1]
        } else {
            return nil
        }
    }
}
var subscriptExampleObject = SubscriptExample()
let inputIndex = 5
if let currentChar = subscriptExampleObject[inputIndex] {
    print("Character at \(inputIndex) is \(currentChar.uppercased())\n")
} else {
    print("String index out of bounds\n")
}

//Q - 15: Create one swift subscript program which takes range as input and returns the string between the ranges
extension SubscriptExample {
    subscript(startIndex: Int, endIndex: Int) -> String? {
        var finalString = ""
        let charArrayOfString = [Character](myString)
        if startIndex >= 1 && endIndex <= myString.count {
            for index in startIndex ... endIndex {
                finalString += String(charArrayOfString[index - 1])
            }
            return finalString
        } else {
            return nil
        }
    }
}
var subscriptRangeObject = SubscriptExample()
let startIndex = 1, endIndex = 10
if let finalString = subscriptRangeObject[startIndex, endIndex] {
    print("Given substring: \(finalString)\n")
} else {
    print("Enter proper range\n")
}

//Q - 16: I have one integer array and create one function which takes range as input and returns all elements between the range
class SubscriptIntArrayExample {
    var someIntArray = [1, 5, 10, 15, 20, 25, 30]
    subscript (startIndexOfIntArray: Int, endIndexOfIntArray: Int) -> [Int]? {
        var finalIntArray: [Int] = []
        if startIndexOfIntArray >= 1 && endIndexOfIntArray <= someIntArray.count {
            for index in startIndexOfIntArray ... endIndexOfIntArray {
                finalIntArray.append(someIntArray[index - 1])
            }
            return finalIntArray
        } else {
            return nil
        }
    }
}
var subscriptIntArrayObject = SubscriptIntArrayExample()
let firstIndex = 3, lastIndex = 5
if let finalIntArray = subscriptIntArrayObject[firstIndex, lastIndex] {
    print("Given sub array: \(finalIntArray)\n")
} else {
    print("Enter proper range\n")
}

//Q - 17: I have one key value pair array. Create one function using subscript which takes key as input and returns it’s value
class SubscriptDictExample {
    var givenDictionary = [1: "Hello", 2: "Hi", 3: "Hey"]
    subscript (givenKey: Int) -> String? {
        if let value = givenDictionary[givenKey] {
            return value
        } else {
            return nil
        }
    }
}
var subscriptDictObject = SubscriptDictExample()
var inputKey = 2
if let outputValue = subscriptDictObject[inputKey] {
    print("Key: \(inputKey), Value: \(outputValue)\n")
} else {
    print("Cannot find key!\n")
}

//Q - 18: Create one array of type Person and create one subscript function which takes person name as input and returns person info like name, age, birthdate etc
class SomePersonClass {
    var nameOfPerson: String
    var ageOfPerson: Int
    var birthDate: String
    var allObjectsOfPerson: [SomePersonClass] = []
    
    init (name: String, age: Int, birthdate: String) {
        nameOfPerson = name
        ageOfPerson = age
        birthDate = birthdate
    }
    subscript (nameOfPerson: String) -> SomePersonClass? {
        for person in allObjectsOfPerson {
            if person.nameOfPerson == nameOfPerson {
                return person
            }
        }
        return nil
    }
}
var arrayOfAllPersonArray: [SomePersonClass] = []
arrayOfAllPersonArray.append(SomePersonClass(name: "Vraj", age: 21, birthdate: "03/03/2001"))
arrayOfAllPersonArray.append(SomePersonClass(name: "Ashrut", age: 22, birthdate: "23/04/2000"))
arrayOfAllPersonArray.append(SomePersonClass(name: "Nishchay", age: 21, birthdate: "20/01/2001"))
var somePersonClassObject = SomePersonClass(name: "", age: 0, birthdate: "")
somePersonClassObject.allObjectsOfPerson = arrayOfAllPersonArray
let personName = "Ashrut"
if let currentPerson = somePersonClassObject[personName] {
    print("Name: \(currentPerson.nameOfPerson), Age: \(currentPerson.ageOfPerson), Birthdate: \(currentPerson.birthDate)\n")
} else {
    print("Cannot find person with name \(personName)\n")
}

//Q - 19: Create one base class of type Song and create subclasses of music types (Hip-Hop, classical) and show usage of inheritance.
//Here Music class have property singer, composer

//Implementation for this problem is already given in Classes Q-8.

//Q - 20: Create a swift class with properties which can be read-write outside of class
//By default the type of variables is public so we can directly read or write on the variable
//Implementation for the same is provided in most of the problems above. (specifically Classes Q-3)

    /*  Error Handling  */

//Q - 1: Create a password validation program. If length of password is less than 8 characters, it throws “Password too short” exception and
//if password is empty, throw “Empty password” exception
enum Password: Error {
    case tooShort
    case empty
}
class SetPassword {
    func checkPassword(password: String) throws -> Bool {
        guard password.count > 0 else {
            throw Password.empty
        }
        guard password.count >= 8 else {
            throw Password.tooShort
        }
        return true
    }
}
var newPassword = SetPassword()
let currentPassword = "Simform@123"
do {
    try newPassword.checkPassword(password: currentPassword)
    print("Current password is a valid password\n")
} catch Password.tooShort {
    print("Password is too short\n")
} catch Password.empty {
    print("Password can not be empty\n")
}

//Q - 2: Create a program for shopping cart. If desired quantity for an item is not available, throw exception
enum StockError: Error {
    case stockNotAvailable
}
class ShoppingCart {
    var firstItemQuantity = 10
    var secondItemQuantity = 8
    var thirdItemQuantity = 5
    
    func buyFirstItem(quantity: Int) throws {
        guard quantity <= firstItemQuantity else {
            throw StockError.stockNotAvailable
        }
        firstItemQuantity -= quantity
    }
    func buySecondItem(quantity: Int) throws {
        guard quantity <= secondItemQuantity else {
            throw StockError.stockNotAvailable
        }
        secondItemQuantity -= quantity
    }
    func buythirdItem(quantity: Int) throws {
        guard quantity <= thirdItemQuantity else {
            throw StockError.stockNotAvailable
        }
        thirdItemQuantity -= quantity
    }
}
var myShoppingCart = ShoppingCart()
var buyQuantity = 8
do {
    try myShoppingCart.buyFirstItem(quantity: buyQuantity)
    print("Succesfully bought \(buyQuantity) items from first item.")
} catch StockError.stockNotAvailable {
    print("Cannot buy desired amount of items from first item.")
}
do {
    try myShoppingCart.buySecondItem(quantity: buyQuantity)
    print("Succesfully bought \(buyQuantity) items from second item.")
} catch StockError.stockNotAvailable {
    print("Cannot buy desired amount of items from second item")
}
do {
    try myShoppingCart.buythirdItem(quantity: buyQuantity)
    print("Succesfully bought \(buyQuantity) items from third item.")
} catch StockError.stockNotAvailable {
    print("Cannot buy desired amount of items from third item")
}
print("Total items available: First: \(myShoppingCart.firstItemQuantity), Second: \(myShoppingCart.secondItemQuantity), Third: \(myShoppingCart.thirdItemQuantity)\n")

    /*  Extensions  */

//Create following string manipulation functions using string extensions
//A character in a string at 5th position
//Replace one character with other in a string
//Remove white spaces from string
//Get number of words in a string
extension String {
    func getFifthIndex() -> String {
        let charArray = [Character](self)
        return String(charArray[4])
    }
    
    func changeSpecificIndex(index: Int, newChar: Character) -> String {
        var charArray = [Character](self)
        charArray[index - 1] = newChar
        return String(charArray)
    }
    
    func removeWhiteSpaces() -> String {
        let charArray = [Character](self)
        var finalString = ""
        for char in charArray {
            if char != " " {
                finalString += String(char)
            }
        }
        return finalString
    }
    
    func getNoOfWords() -> Int {
        let stringArray = self.components(separatedBy: " ")
        return stringArray.count
    }
}
var firstString = "Simform"
var secondString = "Con cat in a tion"
var thirdString = "This is a new string"
print("Getting 5th character of '\(firstString)': \(firstString.getFifthIndex())")
print("Replacing 3rd index by 'n' in '\(firstString)': \(firstString.changeSpecificIndex(index: 3, newChar: "n"))")
print("Removing white spaces from '\(secondString)': \(secondString.removeWhiteSpaces())")
print("Counting number of words in '\(thirdString)': \(thirdString.getNoOfWords())")
