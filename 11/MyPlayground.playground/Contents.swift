//MARK: task 1

import Foundation

func emptyReturn(f: () -> () ) {
    
    print("start")
    var sum = 0
    for i in 1...10 {
        sum += i
        print("i = \(i)" )
    }
    print("sum = \(sum)")
    f()
}

emptyReturn{
    print("end")
}

//MARK: task 2
var  array = [1, 9, 4, 2, 222, 34, 55, 2]

print("increase array: \(array.sorted(by: <) ) ")
print("decrease array: \(array.sorted(by: >) ) ")

print("array : \(array)")

//MARK: task 3

func returnValue(array: [Int], closure: (Int, Int?) -> Bool ) -> Int {
    
    var optionalTmp: Int?
    
    for value in array {
        optionalTmp = closure(value, optionalTmp) ? value : optionalTmp
    }
    return optionalTmp ?? 0
    
}

 
let max = returnValue(array: array, closure: {(i, someI) -> Bool in
    if someI != nil {
        return i > someI!
    }
    return true
})

let min = returnValue(array: array, closure: {(i, someI) -> Bool in
    if someI != nil {
        return i < someI!
    }
    return true
})

print("max in array = \(max)")
print("min in array = \(min)")



//MARK: task 4


func dictFromString(str: String) -> [Character : Bool]{
    
    var dict = [Character : Bool]()
    
    for char in str {
        dict[char] = true
    }
    return dict
}

func travelingOfString(phrase: String) -> String {
    
    let numbers  = "01234567890"
    let consunats = "QqWwRrTtPpSsDdFfGgHhJjKkLlZzXxCcVvBbNnMm"
    let vowels = "EeYyUuIiOoAa"
    let signs = ".,:;!?%"
    
    let numbersDict = dictFromString(str: numbers)
    let consunatsDict = dictFromString(str: consunats)
    let vowelsDict = dictFromString(str: vowels)
    let signsDict = dictFromString(str: signs)

    var vowelsArray = [Character]()
    var consunatsArray = [Character]()
    var numbersArray = ""
    var signsArray = ""
    
    
    let phraseArray = Array(phrase)
    
    for char in phraseArray {
        
        switch char {
            
        case _ where vowelsDict[char] != nil:
            vowelsArray.append(char)
        
        case _ where consunatsDict[char] != nil:
            consunatsArray.append(char)
            
        case _ where numbersDict[char] != nil:
            numbersArray.append(char)
            
        case _ where signsDict[char] != nil:
            signsArray.append(char)
        
        default: break
        }
    }
   
    let resultStr = String(vowelsArray.sorted() + consunatsArray.sorted() + numbersArray.sorted() + signsArray.sorted())
    
    return resultStr
}


let phrase = "One day i will become a developer! I will do it! 100% jshfdsbhvgdfhgvkydgfhdgkgshdghkgfhksbhf"

let resultStr = travelingOfString(phrase: phrase)
print("phrase: \(phrase)")
print("result phrase: \(resultStr)")

//MARK: task 5

func returnValue(array: [Character], closure: (Character, Character?) -> Bool ) -> Character {
    
    var optionalTmp: Character?
    
    for char in array {
        optionalTmp = closure(char, optionalTmp) ? char : optionalTmp
    }
    return optionalTmp ?? "0"
}

let strArray = Array("azbhxvdjskn")

let maxStr = returnValue(array: strArray, closure: {(i, someI) -> Bool in
    if someI != nil {
        return i > someI!
    }
    return true
})

let minStr = returnValue(array: strArray, closure: {(i, someI) -> Bool in
    if someI != nil {
        return i < someI!
    }
    return true
})

print("max in array = \(maxStr)")
print("min in array = \(minStr)")


//MARK: fix task 4

func priority(char: Character) -> Int {
    switch char.lowercased() {
    case "a", "e", "y", "u", "i", "o": return 1
    case "a"..."z": return 2
    case "0"..."9": return 3
    default: return 4
    }
}

func travelingOfString2(phrase: String) -> String {
   
    var vowelsArray = [Character]()
    var consunatsArray = [Character]()
    var numbersArray = [Character]()
    var signsArray = [Character]()
        
    let phraseArray = Array(phrase)
    
    for char in phraseArray {
        
        switch priority(char: char) {
            
        case 1: vowelsArray.append(char)
        
        case 2: consunatsArray.append(char)
            
        case 3: numbersArray.append(char)
            
        case 4: signsArray.append(char)
        
        default: break
        }
    }
   
    let resultStr = String(vowelsArray.sorted() + consunatsArray.sorted() + numbersArray.sorted() + signsArray.sorted())
    
    return resultStr
}


let phrase2 = "One day i will become a developer! I will do it! 100% jshfdsbhvgdfhgvkydgfhdgkgshdghkgfhksbhf"

let resultStr2 = travelingOfString2(phrase: phrase)
print("phrase: \(phrase2)")
print("result phrase: \(resultStr2)")





/*
let numbers = [4, 3, 12, 7, 6, 3, 56, 7, 8, 9, 10, 4, 3, 1, 8, 11]

func filterArray(array: [Int], f: (Int) -> Bool ) -> [Int] {
    
    var filtered = [Int]()
    for value in array {
        if f(value) {
            filtered.append(value)
        }
    }
    return filtered
}
/*
func compare(i: Int) -> Bool {
    
    return  i % 2 == 0
}
*/


filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i % 2 == 0
})

filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i % 2 == 1
})

//-----
//MARK:  simple form
//FIXME: aaa
//TODO: fix it)

filterArray(array: numbers, f: {i in
    return i % 2 == 0
})
let a1 =
filterArray(array: numbers, f: {i in i % 2 == 1 })

let a =
filterArray(array: numbers, f: {$0 % 3 == 0 })

let a3 =
filterArray(array: numbers) {$0 % 3 == 0 }

let array = [1, 2, 3, 5, 7, 123]

var count = 0

let a4 =
filterArray(array: numbers) { value in
    
    for include in array {
        count += 1
        if include == value {
            return true
        }
    }
    return false
}

count

count = 0

var dict = [Int: Bool]()

for value in array {
    count += 1
    dict [value] = true
}



let a5 =
filterArray(array: numbers) { value in
    count += 1
    return dict[value] != nil
}

count
*/
