import Darwin

//task 1
/*


let vowelsAlhabet = ["a", "e","i", "y", "u", "o"]
let consonatsAlhabet = ["q", "w", "r", "t", "p", "s", "d", "f", "g", "h", "j", "k", "l","z","x","c", "v", "b", "n", "m"]
let numbersAlhabet = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

*/

let str = "Hey gays. How are you? Fine? Cool. Me too. What are you doing? Learn swift. I will can make applications on IOS and MacOS. I think it is future. 762"

var vowels = 0
var consonats = 0
var signs = 0
var numbers = 0
var space = 0
for char in str {
    let lowerChar = char.lowercased()
    switch lowerChar {
        
    case "a", "e","i", "y", "u", "o" :
        vowels += 1
        
    case "q", "w", "r", "t", "p", "s", "d", "f", "g", "h", "j", "k", "l","z","x","c", "v", "b", "n", "m" :
        consonats += 1
        
    case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" :
        numbers += 1

    case " " :
        space += 1
        
    default: signs += 1
    }
    
}

print("amount vowels - \(vowels)")
print("amount consonats - \(consonats)")
print("amount numbers - \(numbers)")
print("amount signs - \(signs)")
print("amount space - \(space)")


// task 2

let age = 19

switch age {
    
case 0 ..< 18 :
    print("child")

case 18 ..< 30 :
    print("young man")

case 30 ..< 60 :
    print("adult")

case 60...100 :
    print("retiree")

default: break
}

// task 3

let surname = "Амелин"
let name = "Андрей"
let patronymic = "Андреевич"

var appeal = ""

switch (surname, name, patronymic) {
    
case _ where (name.hasPrefix("А") || name.hasPrefix("О") ) :
    appeal = name
    
case _ where (patronymic.hasPrefix("В") || patronymic.hasPrefix("Д")) :
    appeal = name + " " + patronymic
    
case _ where (surname.hasPrefix("Е") || surname.hasPrefix("З")) :
    appeal = surname

default:
    appeal = "\(surname) \(name) \(patronymic)"
}
print("Hello \(appeal). How are you?")

// task 4

var ship1 = (x: 5, y:5, w:1, h:1 )
var ship2 = (x: 9, y:6, w:1, h:2 )

var hitPoint = (x: 5, Y: 5)

switch hitPoint {
    
case (5,5):
    print("kill")
case (9, 6...7):
    print("there is a hit")
default:
    print("point not found")
}


/*
var ships1 : [(x: Int, y: Int)] = [(5,5), (6,4), (3,3) ] // single-desk ships
//                                             3,8 - knocked, other alives
var ships2 : [(x1: Int, y1: Int, x2: Int, y2: Int)] = [(3, 8, 4, 8), (9, 6, 9, 7) ] // double-desk ships

let hitPoint : (x: Int, y: Int) = (9,6)

switch hitPoint {
    
case let(x, y) where (x == ships1[0].x && y == ships1[0].y) ||
             (x == ships1[1].x && y == ships1[1].y) ||
             (x == ships1[2].x && y == ships1[2].y) ||
             (x == ships2[0].x2 && y == ships2[0].y2) :
    print("kill")
    
case let(x, y) where  (x == ships2[1].x1 && y == ships2[1].y1) || (x == ships2[1].x2 && y == ships2[1].y2) :
    print("there is a hit")
          
case let(x, y) where (x > 10 || x < 1  || y > 10 || y < 1 ) :
    print("Point not found")

default: print("no hit ")
}
*/

/*

mainLoop: for _ in 0 ... 1000{
    for i in 0 ..< 20 {
        if (i < 15) {
            continue
        }
        if i == 10 {
            break mainLoop
        }
    }
}




var age = 56
var name = "Alex"
switch age {
    case 0 ... 16 :
    print("shkololo"); fallthrough // up down to case 2 and ignor case 2 condition
    
    case 17 ... 21 :
        print("student")
    
    case 22 ... 50 :
        break
    case 51, 56, 57, 60:
        print("work")
    default:
        break
}

switch name {
    
    case "Alex" where age < 50:
        print("hi buddy!")
        
    case "Alex" where age >= 50:
        print("i don't know you")
        
    default:
        break
}

let tuple = (name, age)
switch tuple {
    
    
    
    case ("Alex", 60): print("hi Alex 60")
    
    case ("Alex", 50): print("hi Alex 50")
    
    case (_, let number) where (number >= 65) && (number <= 70) :
        print("hi old man")

    case ("Alex", _): print("hi Alex")
    
    default:break
    
}

let point = (5,5)

switch point {
    case let (x,y) where x == y:
    print("x == y")
    case let (x,y) where x == -y:
        print("x == -y")
    case let (_, y) where y < 0:
        print("y < 0")
    default:
        break
}


let array : [Any] = [5, 5.4, Float(5.4)]

switch array[1] {
    case _ as Int :
    print("Int")
    
    case _ as Float :
        print("Float")
    case _ as Double :
        print("Double")
        
    default:
        break
        
    
}
*/
