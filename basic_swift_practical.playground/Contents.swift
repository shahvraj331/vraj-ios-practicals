import UIKit

//Print Hello World in swift Play Ground
var greeting = "Hello World!"
print("\(greeting)\n")

    /*  Variables  */

//Create variables of different types and print it
let givenChar: Character = "A"
let givenString: String = "My name is Vraj Shah"
var givenInt: Int = 81
var givenFloat: Float = 25.52
let givenDouble: Double = 64.45
let givenBool: Bool = true
print("\(givenChar), \(givenString), \(givenInt), \(givenFloat), \(givenDouble), \(givenBool).")

//Create one integer and perform addition with 5 to that and print values
givenInt = givenInt + 5
print(givenInt)

//There is one constant with value of interest rate (15%) create one playground for calculate interest for given amount and duration
let principalAmout = 15000
let timeTaken = 5
let interestRate = 0.15
let simpleInterest = Double(principalAmout) * interestRate * Double(timeTaken)
print("Interest for principal amount = \(principalAmout), interest rate = \(interestRate) and time taken = \(timeTaken) is \(simpleInterest)\n")

    /*  Operators  */

//Create example for String concate using operators
let firstName = "Vraj"
let surname = "Shah"
let fullName = firstName + " " +  surname
print("\(fullName)")

//Create one example for show usage of operator's addition, multiplication, division for integers and floats
let addResult = Float(givenInt) + givenFloat
let mulResult = givenInt * Int(givenFloat)
let divResult = Float(givenInt) / givenFloat
print("Addition result: \(addResult), Multiplication result: \(mulResult), Division result: \(divResult)")

//What is ternery operator and show example of usage?
let ageOfPerson = 36
let isValidAge = ageOfPerson > 32 ? true : false
if isValidAge {
    print("\(ageOfPerson) is a valid age.\n")
}

    /*  Working with Text  */

//1ST: STRING AND CHARACTERS
//Write a Swift program to create a new string made of a copy of the first two characters of a given string.
//If the given string is shorter than length 2, return whatever there is.
let firstString = "Simform"
let secondString = "A"
let maxLength = 2
var inputString = firstString
if inputString.count <= maxLength {
    print(inputString)
} else {
    let firstTwoCharsIndex = inputString.index(inputString.startIndex, offsetBy: 2)
    let firstTwoChars = inputString[..<firstTwoCharsIndex]
    print(firstTwoChars)
}

//Write a Swift program to create a new string without the first and last character of a given string.
//The string length must be at least 2
inputString = firstString
if inputString.count >= 2 {
    inputString.removeFirst()
    inputString.removeLast()
    print(inputString)
} else {
    print("Input string must have length of 2 or more.")
}

//Write a Swift program that accept two strings and return their concatenation, except the first char of each string.
//The given strings length must be at least 1.
var stringOne = "Swift"
var stringTwo = "Examples"
if stringOne.count >= 1 && stringTwo.count >= 1 {
    stringOne.removeFirst()
    stringTwo.removeFirst()
    print("\(stringOne + stringTwo)")
} else {
    print("Input string must have length of 1 or more.")
}

//Write a Swift program to move the first two characters of a given string to the end.
//The given string length must be at least 2.
inputString = firstString
if inputString.count >= 2 {
    for _ in 0 ..< 2 {
        let firstChar = inputString.removeFirst()
        inputString = inputString + String(firstChar)
    }
    print(inputString)
}

//Write a Swift program to test if a given string starts with "Sw"
inputString = "Swift"
if inputString.hasPrefix("Sw") {
    print(true)
} else {
    print(false)
}

//Write a Swift program to create a new string made of the first and last n chars from a given string. The string length will be at least n.
inputString = "Simform Soultions"
let distinctValue = 3
let firstNChar = inputString[..<(inputString.index(inputString.startIndex, offsetBy: distinctValue))]
let lastNChar = inputString[(inputString.index(inputString.endIndex, offsetBy: -(distinctValue))) ..< inputString.endIndex]
print("\(firstNChar)\(lastNChar)\n")

//2ND: ARRAY
//Write a Swift program to check whether the first element and the last element of a given array of integers are equal. The array length must be 1 or more.
var inputArray: [Int] = [5, 10, 15, 20]
if inputArray.first == inputArray.last && inputArray.count >= 1 {
    print("First and last element are equal")
} else {
    print("First and Last element are not equal")
}

//Write a Swift program to create a new array with double the lenght of a given array of integers and its last element is the same as the given array.
//The given array will be length 1 or more. By default, a new integer array contains all 0's
let newSizeOfArray = inputArray.count * 2
if newSizeOfArray > 0 {
    var resultantArray: [Int] = []
    for _ in 1 ..< newSizeOfArray {
        resultantArray.append(0)
    }
    resultantArray.append(inputArray[inputArray.count - 1])
    print("Input array: \(inputArray)\t Resultant array: \(resultantArray)")
}

//Write a Swift program to create a new array, taking first two elements from a given array of integers.
//If the length of the given array is less than 2 use the single element of the given array
var newArray: [Int] = []
if inputArray.count <= 2 {
    newArray = inputArray
} else {
    for index in 0 ..< 2 {
        newArray.append(inputArray[index])
    }
}
print("New array formed by first two elements: \(newArray)")

//Write a Swift program to take one array and find out maximum number from that array
if let largestValue = inputArray.max() {
    print("Largest value in given array: \(largestValue)")
}

//Write a Swift program to take one array and sort it in descending order.
print("Input array in descending order: \(inputArray.sorted(by: >))")

//Print all the numbers from listOfNumbers that are divisible by at least one number from divisors
let valuesArray = [1, 2, 3, 10, 100]
let divisorArray = [2, 5]
var outputString: String = ""
print("Values that are diivisible by any divisor are: ", terminator: "")
for value in valuesArray {
    for divisor in divisorArray {
        if value % divisor == 0 {
            outputString += "\(value), "
            break
        }
    }
}
print("\(outputString.dropLast(2))\n")

    /*  Control Flow  */

//Print the powers of 2 that are less than or equal to N.
let maxPossibleValue = 100
var resultantValue: Int = 0
var currentPower = 1
repeat {
    resultantValue = Int(pow(Double(2), Double(currentPower)))
    if resultantValue > 100 {
        break
    }
    print("\(resultantValue) ", terminator: "")
    currentPower += 1
} while (true)
print("\n")

//Given an integer N draw a square of N x N asterisks. Look at the examples
let matrixSize = 3
for _ in 1 ... matrixSize {
    for _ in 1 ... matrixSize {
        print("*", terminator: " ")
    }
    print()
}
print()

//Given an integer N draw a triangle of asterisks. The triangle should have N lines, the i-th line should have i asterisks on it.
let triangleLength = 4
for row in 1 ... triangleLength {
    for _ in 1 ... row {
        print("*", terminator: " ")
    }
    print()
}
print()

//Given an integer N draw a pyramid of asterisks.
//The pyramid should have N lines. On the i-th line there should be N-i spaces followed by i*2-1 asterisks
let pyramidLength = 4
for row in 1 ... pyramidLength {
    if row != pyramidLength {
        for _ in 1 ... (pyramidLength - row) {
            print(" ", terminator: " ")
        }
    }
    for _ in 1 ... ((row * 2) - 1) {
        print("*", terminator: " ")
    }
    print()
}
print()

//You are given a number. Print "prime" if the number is a prime and "not prime" otherwise.
let givenNumber = 17
var isPrime: Bool = true
for number in 2 ..< givenNumber {
    if givenNumber % number == 0 {
        isPrime = false
        break
    }
}
if isPrime {
    print("\(givenNumber) is a prime number.\n")
} else {
    print("\(givenNumber) is not a prime number.\n")
}

    /*  Dictionaries  */

//You are given a dictionary code of type [String:String] which has values for all lowercase letters.
//The codedictionary represents a way to encode a message. For example if code["a"] = "z" and code["b"] = "x" the encoded version if "ababa" will be "zxzxz".
//You are also given a encodedMessage which contains only lowercase letters and spaces.
//Use the codedictionary to decode the message and print it.
//Write a Swift program to decode the message and print final output string
var code = [
"a" : "b",
"b" : "c",
"c" : "d",
"d" : "e",
"e" : "f",
"f" : "g",
"g" : "h",
"h" : "i",
"i" : "j",
"j" : "k",
"k" : "l",
"l" : "m",
"m" : "n",
"n" : "o",
"o" : "p",
"p" : "q",
"q" : "r",
"r" : "s",
"s" : "t",
"t" : "u",
"u" : "v",
"v" : "w",
"w" : "x",
"x" : "y",
"y" : "z",
"z" : "a" ]
var encodedMessage = "nz obnf jt wsbk tibi"
var decodedMessage: String = ""
var charArray = [Character](encodedMessage)
var currentChar: Character
repeat {
    if let firstCharacter = charArray.first {
        currentChar = firstCharacter
    } else {
        break
    }
    if currentChar != " " {
        let decodedKeyValuePair = code.filter { $0.value == String(currentChar) }
        if let decodedKey = decodedKeyValuePair.keys.first {
            decodedMessage += decodedKey
        }
    } else {
        decodedMessage += " "
    }
    charArray.removeFirst()
} while (!charArray.isEmpty)
print("\(decodedMessage)\n")

//You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”.
//Create an array of strings called firstNames that contains only the values for “firstName” from each dictionary
var peopleArray: [[String : Any]] = [
    ["firstName": "Calvin", "lastName": "Newton", "score": 13],
    ["firstName": "Garry", "lastName": "Mckenzie", "score": 12],
    ["firstName": "Leah", "lastName": "Rivera", "score": 10],
    ["firstName": "Sonja", "lastName": "Moreno", "score": 3],
    ["firstName": "Noel", "lastName": "Bowen", "score": 16]
]
var firstNameArray: [String] = []
for index in 0 ..< peopleArray.count {
    let currentDict = peopleArray[index]
    if let firstNameString = currentDict["firstName"] as? String {
        firstNameArray.append(firstNameString)
    }
}
print("Firstnames = \(firstNameArray)\n")

//You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”.
//Create an array of strings called fullNames that contains the values for “firstName” and “lastName” from the dictionary separated by a space.
var fullNameArray: [String] = []
for index in 0 ..< peopleArray.count {
    let currentDict = peopleArray[index]
    var fullName = ""
    if let firstNameString = currentDict["firstName"] as? String, let lastNameString = currentDict["lastName"] as? String {
        fullName = firstNameString + " " + lastNameString
    }
    fullNameArray.append(fullName)
}
print("Fullnames = \(fullNameArray)\n")

//You are given an array of dictionaries. Each dictionary in the array describes the score of a person.
//Find the person with the lowest score and print his full name
var lowestScore = 1000
var personWithLowestScore: String = ""
for index in 0 ..< peopleArray.count {
    let currentDict = peopleArray[index]
    if let score = currentDict["score"] as? Int {
        if score < lowestScore {
            lowestScore = score
            if let firstNameString = currentDict["firstName"] as? String, let lastNameString = currentDict["lastName"] as? String {
                personWithLowestScore = firstNameString + " " + lastNameString
            }
        }
    }
}
print("\(personWithLowestScore) has the lowest score, that is \(lowestScore)\n")

//You are given an array of dictionaries. Each dictionary in the array describes the score of a person.
//Print the leaderboard.
var scoreSortedArray = peopleArray.sorted(by: {
    $0["score"] as? Int ?? .zero > $1["score"] as? Int ?? .zero
})
var fullNameInLeaderboard: String = ""
for index in 1 ... scoreSortedArray.count {
    let currentDict = scoreSortedArray[index - 1]
    if let firstNameString = currentDict["firstName"] as? String, let lastNameString = currentDict["lastName"] as? String, let scoreString = currentDict["score"] as? Int {
        fullNameInLeaderboard = index + ". " + firstNameString + " " + lastNameString + " - " + scoreString
        print(fullNameInLeaderboard)
    }
}
print()

//You are given an array of integers. Find out the frequency of each one.The frequency of a number is the number of times it appears in the array.
//Print the numbers in ascending order followed by their frequency.
var arrayOfInts = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
var frequencyDict: [Int: Int] = [:]
for index in 0 ..< arrayOfInts.count {
    if let frequency = frequencyDict[arrayOfInts[index]] {
        frequencyDict[arrayOfInts[index]] = frequency + 1
    } else {
        frequencyDict[arrayOfInts[index]] = 1
    }
}
var sortedFreqDict = frequencyDict.sorted(by: <)     //{ $0.0 < $1.0 }
for (key, value) in sortedFreqDict {
    print("\(key) \(value)")
}
print()

    /*  Optionals  */

//Create an example of demonstrating How to declare optionals in swift
//What is force unwrapping in optionals show usage in example.
//Create one example using if-let
//Create one example using guard-let
//Create one example using nil coalescing operator
var myString: String?
myString = "Hello World!"
if myString != nil {
    print("\(myString!)\n")     //example of force unwrapping
}

myString = nil
if let yourString = myString {
   print("Your string has - \(yourString)\n")
} else {
   print("Your string does not have a value\n")
}

func checkAge(myString: String?) -> Bool {
    guard let checkString = myString else {
        print("Input string has nil value.")
        return false
    }
    print("Your string is: \(checkString)")
    return true
}
checkAge(myString: "ABCD")
checkAge(myString: nil)
print()

print("\(myString ?? "No value")\n")

//example of structure and enum in swift
struct student {
    let firstname: String
    let surname: String
    let gender: Gender
}
enum Gender: String {
    case male = "male"  //or simply write case male
    case female
}
let firstStudent = student(firstname: "Vraj", surname: "Shah", gender: .male)
let secondStudent = student(firstname: "Dhyani", surname: "Desai", gender: .female)

print("\(firstStudent.firstname)-\(firstStudent.surname)-\(firstStudent.gender)")
print("\(secondStudent.firstname)-\(secondStudent.surname)-\(secondStudent.gender)\n")

    /*  PROBLEMS  */

//PROBLEM - 1
//You are working on a smart-fridge. The smart-fridge knows how old the eggs and bacon in it are. You know that eggs spoil after 3 weeks (21 days) and bacon after one week (7 days).
//Given baconAge and eggsAge(in days) determine if you can cook bacon and eggs or what ingredients you need to throw out.
//If you can cook bacon and eggs print you can cook bacon and eggs.
//If you need to throw out any ingredients for each one print a line with the text throw out <ingredient> (where <ingredient> is bacon or eggs) in any order.
var baconAge = 3
var eggsAge = 2

if baconAge > 21 && eggsAge <= 7 {
    print("throw out bacon")
    print("You can cook eggs")
} else if baconAge <= 21 && eggsAge > 7 {
    print("throw out eggs")
    print("You can cook bacon")
} else if baconAge > 21 && eggsAge > 7 {
    print("throw out bacon")
    print("throw out eggs")
} else {
    print("You can cook bacon and eggs")
}
print()

//PROBLEM - 2
//You are given a year, determine if it’s a leap year. A leap year is a year containing an extra day. It has 366 days instead of the normal 365 days.
//The extra day is added in February, which has 29 days instead of the normal 28 days. Leap years occur every 4 years. 2012 was a leap year and 2016 will also be a leap year.
//The above rule is valid except that every 100 years special rules apply. Years that are divisible by 100 are not leap years if they are not also divisible by 400.
//For example 1900 was not a leap year, but 2000 was. Print Leap year! or Not a leap year! depending on the case.
func checkLeapYear(year: Int) -> String {
    if year % 4 == 0 {
        if year % 100 == 0 && year % 400 == 0 {
            return "Leap year!"
        } else {
            return "Not a leap year!"
        }
    } else {
        return "Not a leap year!"
    }
}

print(checkLeapYear(year: 2017))
print(checkLeapYear(year: 2000))
print()

//PROBLEM - 3
//You are working on a videogame where the character has a certain number of hitpoints(HP) ranging from 0 to 100.
//100 represents full health, 0 represents dead.
//You want to add regenerating health to the game using the following rules:
//HP always regenerates up to numbers of the form X0 (75 -> 80 , 32 -> 40 …)
//When HP is below 20 it regenerates up to 20 (13 -> 20, 5 -> 20, …)
//If the character has 0 HP then he doesn’t regenerate life (he’s dead)
//Given the current hp of the character stored in a variable hp print the hp the player will have after regenerating life.
func getRegenHealth(health: Int) -> String {
    if health <= 20 && health > 0 {
        return String(20)
    } else if health >= 100 {
        return String(100)
    } else if health == 0 {
        return "He's dead"
    } else {
        if health % 10 == 0 {
            return String(health)
        } else {
            var regenHealth = health / 10
            regenHealth *= 10
            regenHealth += 10
            return String(regenHealth)
        }
    }
}

print(getRegenHealth(health: 75))
print(getRegenHealth(health: 13))
print(getRegenHealth(health: 0))
print(getRegenHealth(health: 110))
print()

//PROBLEM - 4
//You are given three grades obtained by 3 students in a class stored in variables grade1, grade2, grade3 of typeDouble.
//You are also given your grade in the class stored in a variable yourGrade of type Double.
//Print above average if your grade is greater than the class average or below average” otherwise.
//Note: the average of the class includes your grade.
let firstGrade = 7.0
let secondGrade = 9.0
let thirdGrade = 5.0
let yourGrade = 8.0

let avgGrade = (firstGrade + secondGrade + thirdGrade + yourGrade) / 4  //7.25
if yourGrade > avgGrade {
    print("Above average")
} else if yourGrade < avgGrade {
    print("Below average")
} else {
    print("Equal to average")
}
print()

//PROBLEM - 5
//You have the cost of a meal at a restaurant stored in a variable mealCost of type Double.
//You would like to leave a tip of a certain percentage. The percentage is stored in a variable tip of type Int.
//Print the total cost of the meal.
let mealCost: Double = 64.5
let tipPercent: Int = 20
let totalCost = mealCost + ((mealCost * Double(tipPercent)) / 100)
print("Total cost: \(totalCost)")

