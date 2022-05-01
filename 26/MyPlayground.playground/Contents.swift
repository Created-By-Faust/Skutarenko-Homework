

//MARK: task 1
// перегружить операторы вычитания, деления , -=, --
struct Point {
    var x : Double
    var y : Double
}

var p1 = Point(x: 2, y: 3)
var p2 = Point(x: 3, y: 5)


func - (a: Point, b: Point) -> Point {
    return Point(x: a.x - b.x, y: a.y - b.y)
}
p1 - p2

func / (a: Point, b: Point) -> Point {
    return Point(x: a.x / b.x, y: a.y / b.y)
}
p1 / p2


func -= (a: inout Point, b: Point)  {
    a.x = a.x - b.x
    a.y = a.y - b.y
    
}

p1 -= Point(x: 1, y: 1)

prefix func -- (x: inout Int) -> Int {
    x -= 1
 return x
}

var m = 5

--m

postfix func -- (x: inout Int) -> Int {
    x -= 1
 return x
}

m--


//MARK: task 2
//Добавить структуру Size и прямоугольник(точка плюс свайз). перегрузить операторы сложения и вычитания

import Darwin

func == (a: Point, b: Point) -> Bool {
    return (a.x == b.x && a.y == b.y) ? true : false
}

func != (a: Point, b: Point) -> Bool {
    return (a.x != b.x && a.y != b.y) ? true : false
}

struct Size {
    var sizeX : Int
    var sizeY : Int
}

struct Rectangle {
    var point : Point
    var size : Size
    
    init() {
        self.point = Point(x: 0, y: 0)
        self.size = Size(sizeX: 0, sizeY: 0)
    }
    init(point: Point, size: Size) {
        self.point = Point(x: point.x, y: point.y)
        
        self.size = Size(sizeX: size.sizeX, sizeY: size.sizeY)
    }
}


func + (a: Rectangle, b: Rectangle) -> Rectangle {
    
    var res = Rectangle()

    let square : Double = Double(a.size.sizeX * a.size.sizeY + b.size.sizeX * b.size.sizeY)
    let perimert : Double = Double( 2*(a.size.sizeX + b.size.sizeX) + a.size.sizeY + b.size.sizeY)
    
    let d : Double = Double(pow(perimert, 2) - 16 * square)
    
    let y1 : Double = (perimert + sqrt(d)) / 4
    let y2 : Double = (perimert - sqrt(d)) / 4
    
    if y1 > 0 {
        let x1 = perimert / 2 - y1
        res.size = Size(sizeX: Int(x1), sizeY: Int(y1))
    } else {
        if y2 > 0 {
            let x2 = perimert / 2 - y2
            res.size = Size(sizeX: Int(x2), sizeY: Int(y2))
        }
    }
    
    res.point = Point(x: a.point.x, y: a.point.y)
    
    return res
}

var rectangle1 = Rectangle(point: Point(x: 0, y: 0), size: Size(sizeX: 3, sizeY: 2))
var rectangle2 = Rectangle(point: Point(x: 1, y: 1), size: Size(sizeX: 3, sizeY: 2))

var rectange3 = rectangle1 + rectangle2


//MARK: task 3
// Доьавит += к строке. пусть доьбавлеяет Инт.  +=. New operator для двух строк если символы совпали следать их заглавными буквами

import Foundation

func += (s1: inout String, s2: Int) {
    s1.append(contentsOf: String(s2))
}


var s1 = "asns"
let s2 = "dac"

let i1 = 234
s1 += i1

infix operator +! : myprecedence
precedencegroup myprecedence {
    associativity: left
    lowerThan: MultiplicationPrecedence
    higherThan: AdditionPrecedence

}

func +! (s1: String, s2: String) -> String {
    
    var result = ""
    
    for char in s1 {
        
        if s2.contains(String(char)) {
            result += String(char).uppercased()
            continue
        }
        result += String(char)
    }
    return result
}

let s3 = s1 + s2

let s4 = "afjfbdkc"
let s5 = "abc"

let ss = s4 +! s5




/*
struct Point {
    var x : Int
    var y : Int
}

var p1 = Point(x: 2, y: 3)
var p2 = Point(x: 3, y: 5)


func + (a: Point, b: Point) -> Point {
    return Point(x: a.x + b.x, y: a.y + b.y)
}

func * (a: Point, b: Point) -> Point {
    return Point(x: a.x * b.x, y: a.y * b.y)
}



let p3 = p1 + p2

p1 * p2


func += (a: inout Point, b: Point) {
    a = a + b
}

p1
p2
p1 += p2

func == (a: Point, b: Point) -> Bool {
    return a.x == b.x && a.y == b.y
}

p1 == p2
p1 == p1


prefix func ++(x: inout Int) -> Int {
    x += 1
 return x
}

var k = 5

++k

postfix func ++(x: inout Int) -> Int {
    x += 1
 return x
}

k++

if ++k == 8 {
    print("8")
} else {
    print("not 8")
}
    

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

//%%%
infix operator %%%

func %%% (a: inout Point, b : Point) {
    a.x += b.y
    a.y -= b.x
}

p1
p2
p1 %%% p2

var i = 7
var j = 5
i
j

i * 5 / j


infix operator ** : myprecedence
precedencegroup myprecedence {
    associativity: left
    lowerThan: AdditionPrecedence
    higherThan: RangeFormationPrecedence

}


func ** (a: Point, b: Point) -> Point {
    return Point(x: 2 * (a.x + b.x), y: 2 * (a.y + b.y))
}

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

p1 ** p2 ** p1 ** p2

p1 + p2 ** p2 ** p1


var s = "Hello, world!"

import Foundation

func -= (s1: inout String, s2: String) {
    let set = CharacterSet(charactersIn: s2)
    let components  = s1.components(separatedBy: set)
    s1 = components.joined(separator: "")
}

s -= "l,H"
s

s = "0123456789"

func -= (s1: inout String, i : Int) {
    s1 -= String(i)
}

s -= 356
*/
