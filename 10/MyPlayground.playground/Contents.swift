//task 1

import Darwin
func heart() -> String {
    return "❤️"
}

func iPhone() -> String {
    return "📱"
}

func apple() -> String {
    return "🍎"
}
print("I " + heart() + " " + apple() + " " + iPhone() )

//task 2

func whiteOrBlack(letter: String, digit: Int) -> String {
        
    let alphabet = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8]
    
    var color = ""
    let number: Int
    if let temp = alphabet[letter]{
        number = temp
    } else {
        return "Error"
    }
    if digit > 8 && digit < 1 {
        return "Error"
    }
    
    if number % 2 == digit % 2 {
        color = "White"
    } else {
        color = "Black"
    }
    
    return color
}

let color = whiteOrBlack(letter: "b", digit: 8)

print(color)

// Task 3

func arrayFlip (array: [Any]) -> [Any] {
    return array.reversed()
}

func sequenceFlip(sequence: Any... ) -> [Any] {
    return arrayFlip(array: sequence)
}
let a = arrayFlip(array: ["a", "d", "c"])
let b = sequenceFlip(sequence: 1, 3, 5, 7, 9)

print(a)
print(b)

// task 4


func arrayFlip2 (array: inout [String]) {
    array = array.reversed()
}
var mas = ["a", "d", "c"]
arrayFlip2(array: &mas)

print("task 4 : \(mas)")

// Task 5

func upAndDown(str: String) -> String {
    var result = ""
    
    let digitsDictionary = ["0": "null", "1" : "one", "2": "two", "3": "three", "4": "four", "5": "five", "6": "six", "7": "seven", "8": "eight", "9": "nine"]
    
    for char in str.lowercased() {
        let char = String(char)
        
        switch char {
            
        case "a", "e", "i", "o", "u", "y" :
            result += char.uppercased()
        
        case "q", "w", "r", "t", "p", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m" :
            result += char
            
        case _ where digitsDictionary[char] != nil :
            if let numberS = digitsDictionary[char] {
                result += "|" + numberS + "|"
            }
        case " ":
            result += " "
        default:
            result += ""
        }
        
    }
    return result
}

let str = "I jsnjn8 kdfqwertysnj + jisjjaih 091"

print(upAndDown(str: str))


/*
func calculateMoney(wallet: [Int], type: Int? = nil) -> (total: Int,count: Int) {
    
    var sum = 0
    var count = 0
    
    for value in wallet {
        
        if (type == nil) ||
            (value == type!) {
            sum += value
            count += 1
        }
    }
    return (sum, count)
    
}

func callulateMoney(inSequence range: Int... ) -> Int {
    
    var sum = 0
    for value in range {
        sum += value
    }
        
    return sum
}


let wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]


let (money, count) = calculateMoney(wallet: wallet)
let (money2,count2) = calculateMoney(wallet: wallet, type: 5)


money2
count2


callulateMoney(inSequence: 5,5,10,2,3,4,3,23,34)
// func sayHI () <=> sayHi -> ()
func sayHi() -> () {
    print("hi")
}

sayHi()

let hi: ()  = sayHi()

hi

func sayPhrase(phrase: String) -> Int? {
    print(phrase)
    return 0
}

sayPhrase(phrase: "aaa")
let phrase = sayPhrase

phrase("bbn")

func doSomething(whatToDo: () -> () ) {
    whatToDo()
}

doSomething(whatToDo: sayHi)

func whatToDo() -> () -> () {
    func printSomething() {
        print("hello world")
    }
    
    return printSomething
}

whatToDo()()

let iShouldDoThis = whatToDo()
iShouldDoThis()
*/
