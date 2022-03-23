
var juornal = ["Emelin Dmitry" : 5, "Andrey Samoniv" : 2, "Alex Nova" : 2, "Eric Kiti" : 3, "Lexy Evans" : 5]

juornal.updateValue(4, forKey: "Andrey Samoniv")
juornal["Alex Nova"] = 3

juornal["Katy Perry"] = 4
juornal["Alan Savan"] = 3

juornal

juornal["Lexy Evans"] = nil
juornal.removeValue(forKey: "Emelin Dmitry")

juornal

var sum = 0
for (_ , value) in juornal {
    sum += value
}
let gpa : Double = Double(sum) / Double(juornal.count )
print("class GPA - \(gpa)")
// task 2
let daysInMonth = [ "January" : 31,
                   "February" : 28 ,
                      "March" : 31,
                      "April" : 30,
                        "May" : 31,
                        "June": 30,
                       "July" : 31,
                     "August" : 31,
                  "September" : 30,
                    "October" : 31,
                   "November" : 30,
                   "December" : 31]

for (key, value) in daysInMonth {
    print("In \(key) - \(value) days")
}

for key in daysInMonth.keys {
    print("In \(key) - \(daysInMonth[key]!) days")
}

// task 3
//             position : whiteColor
var positions = [String : Bool]()
// True - White
//False - Black
let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h"]
let digits = [1, 2, 3, 4, 5, 6, 7, 8]

for i in 0 ..< alphabet.count {
    for j in 0 ..< digits.count {
        positions["\(alphabet[i])" + "\(digits[j])"] = (i % 2 != j % 2)
    }
}


for (key, value) in positions {
    print("position \(key) - \(value) color")
}
 

/*
//let dict : [String : String ] = ["машина" : "car",  "мужик" : "man"]
//let dict2 = [0: "car", 1 : "man"]
//let dict3 : Dictionary<String, Double> = ["a" : 2.0] // no use


var dict : [String : String ] = ["машина" : "car",  "мужик" : "man"]

dict.count
dict.isEmpty

dict["мужик"]

dict["комп"] = "computer"

Array(dict.keys)
Array(dict.values)


//dict["комп"] = "mac"
dict.updateValue("mac", forKey: "комп")

let comp : String? = dict["комп"]

if let comp = dict["комп2"] {
    print("\(comp)")
} else {
    print("no value for key")
}
/*
//dict["мужик"] = nil
dict.removeValue(forKey: "мужик")

dict

dict = [:]
dict.isEmpty


dict["hello"] = "world"
*/

for key in dict.keys {
    print("key = \(key), value = \(dict[key]!)")
}

for (key, value) in dict {
    print("key = \(key), value = \(value)")
}
*/


