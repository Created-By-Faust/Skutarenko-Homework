let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let monthsName = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

for i in 0 ..< daysInMonth.count {
    print(daysInMonth[i])
}

for (index, value) in daysInMonth.enumerated() {
    print("In \(monthsName[index]) - \(value) days")
}

var monthAndDays :[(name: String, days: Int)] = []
//[("January", 31), ("February", 28), ("March", 31), ("April", 30), ("May", 31), ("June", 30), ("July", 31), ("August", 31), ("September", 30), ("October", 31), ("November", 30), ("December", 31) ]

for i in 0 ..< daysInMonth.count {
    monthAndDays.insert((monthsName[i], daysInMonth[i]), at: i)
}

for tuple in monthAndDays {
    print("In \(tuple.name) - \(tuple.days) days")
}
let example : (month: String, day: Int) = ("January", 12)
var sumDays = 0

for month in monthAndDays {
    if month.name == example.month{
        break
    }
    sumDays += month.days
}

sumDays += example.day
print("until \(example.month) \(example.day) - \(sumDays) days since the new year")

print()
let lenght = daysInMonth.count
for i in 0 ..< lenght  {
    print("In \(monthsName[lenght - 1 - i]) - \(daysInMonth[lenght - 1 - i]) days")
}
print()

let optionalArray : [Int?] = [1, 2, nil, nil, 5]

var sum = 0

for i in optionalArray {
    if let temp = i {
        sum += temp
    }
}
print("Optianal binding sum: \(sum)")
sum = 0

for i in optionalArray {
    if i != nil {
        sum += i!
    }
}
print("Forced unwrapp sum: \(sum)")
sum = 0

for i in optionalArray {
    sum += i ?? 0
}
print("?? operator sum: \(sum)")


let alphabet = "abcdefghijklmnopqrstuwxyz"
var arr : [String] = []

for c in alphabet {
    arr.insert(String(c), at: 0)
}
print(arr)


/*
// Array<String> or [String]
let constArray = ["a","b", "c", "d"]

var array = [String]()

if array.isEmpty {
    print("array is empty")
}

array += constArray
array += ["e"]

array.append("f")

var array2 = array
array
array2

array2[0] = "1"

array
array2

array[1...4] = ["0"]
array
array.insert("-", at: 2)

array.remove(at: 3)
array

//let test = [Int](repeating: 100, count: 10)

let money = [100, 1, 5, 20, 1, 50, 1, 1, 20, 1]

var sum = 0
for  i in 0..<9 {
    sum += money[i]
}
sum

sum = 0

for  i in 0 ..< money.count {
    //print("index = \(i) value = \(money[i])")
        sum += money[i]
}

sum = 0

var i = 0
for value in money {
    //print("index = \(i) value = \(value)")
    sum += value
    i += 1
}

sum = 0

for (index, value) in money.enumerated() {
    print("index = \(index) value = \(value)")
    sum += value
}
*/
