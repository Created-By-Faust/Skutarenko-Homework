/*
 1. расширить CheckList. Добавить методы добавления и чтения хлеба, яблок и т.д. Пусть Пусть меттды принимают маску и говорят установлен ли там соотвествующий бит или нет
 2. Создать цикл , который рисует синусойду
 
 */
//MARK: task 1
extension UInt8 {
    
    func binary() -> String {
        var result = ""
        for i in 0 ..< 8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

enum CheckList : UInt8 {
    case Bread =  0b00000001
    case Chiken = 0b00000010
    case Apples = 0b00000100
    case Pears =  0b00001000
}

extension UInt8 {
    mutating func add(elem: CheckList) {
        self = (self | elem.rawValue)
    }
    func readCheckList() {
        
        if (self & CheckList.Bread.rawValue) > 0 {
            print("Bread")
        }
        if (self & CheckList.Chiken.rawValue) > 0 {
            print("Chiken")
        }
        if (self & CheckList.Apples.rawValue) > 0 {
            print("Apples")
        }
        if (self & CheckList.Pears.rawValue) > 0 {
            print("Pears")
        }
    }
}

var example : UInt8 = 0b00000000
example.add(elem: .Chiken)
example.binary()
example.add(elem: .Chiken)
example.binary()
example.add(elem: .Bread)
example.binary()

example.readCheckList()

//MARK: task 2

func leftShift(a : inout UInt8, k: Int) {
    for _ in 1...k {
        print(a.binary())
        a = a << 1
    }
    
}
func rightShift(a : inout UInt8, k: Int) {
    for _ in 1...k {
        a = a >> 1
        print(a.binary())
    }
}


func sin() {
    var a : UInt8 = 0b00010000
    
    rightShift(a: &a, k: 4)
    leftShift(a: &a, k: 7)
    rightShift(a: &a, k: 4)
}

sin()

/*
 3. 64 битовое число Инт показывает шахматную доску. 1 - черное, 0 - белое. В цикле установить все клетки и сказать какой  клетке какой цвет пренадлежит
 */
print("--------")

extension UInt64 {
    
    func binary() -> String {
        let result = String(self, radix: 2)
    
        return result
    }
}

var d : UInt64 = 0b00000000_00000000_00000000_00000000_00000000_00000000_00000000_10101010
var b : UInt64 = 0b11111111_11111111_11111111_11111111_11111111_11111111_11111111_00000000
d = ~d
d.binary()
b.binary()
var c : UInt64 = (d ^ b) << 0
c.binary()


func createDesk() -> UInt64 {
    //                     1         2         3       4        5        6        7         8
    var res : UInt64 = 0b00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000
    
    let value2: UInt64 =  0b00000000_00000000_00000000_00000000_00000000_00000000_00000000_10101010 // нечет
    let value1 : UInt64 = 0b00000000_00000000_00000000_00000000_00000000_00000000_00000000_01010101 // чет
    
    for i in 1 ... 8 {
        
        if i == 8 {
            res += value1
            break
        }
        
        if i % 2 == 0  {
            res += value1 << (i * 8)
        } else {
            res += value2 << (i * 8)
        }
    }
    return res
}


func whileOrBlack(letter: Character, digit: UInt) -> String {
    
    let alphabet : [Character : UInt] = ["A" : 0, "B" : 1 , "C" : 2, "D" : 3 , "E" : 4 , "F" : 5 , "G" : 6 , "H" : 7]
    if alphabet[letter] == nil {
        return "Error 1"
    }
    if digit > 8 || digit == 0 {
        return "Error 2"
    }
    
    let desk : UInt64 = createDesk()
    desk.binary()
    
    var currentPosition : UInt64 = 0b00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000001
    
    currentPosition = currentPosition << (alphabet[letter]!) // letter position
    currentPosition.binary()
    currentPosition = currentPosition << ((digit - 1) * 8)
    currentPosition.binary()

    
    let flag = desk & currentPosition
    
    return flag > 0 ? "Black" : "White"
}

whileOrBlack(letter: "A", digit: 2)

/*
extension UInt8 {
    
    func binary() -> String {
        var result = ""
        for i in 0 ..< 8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}
/*
0b11111111
0xff
255
*/
var a1: UInt8 = 57

a1.binary()
(5 as UInt8).binary()

a1 = a1 + 0b00000101
a1.binary()

a1 = a1 * 4
a1 = a1 &* 2
a1.binary()


a1 = 0b00000000
a1 = a1 &- 1


extension Int8 {
    
    func binary() -> String {
        var result = ""
        for i in 0 ..< 8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

var b1 : Int8 = 57

b1.binary()

b1 = 0b01111111
b1.binary()
b1 = b1 &+ 1
b1.binary()
b1 = b1 &+ 1
b1.binary()

b1 = 0
b1 = b1 - 1
b1.binary()

b1 = b1 - 1
b1.binary()


b1 = 0b00100001
b1 = b1 << 2

var a: UInt8 = 0b00110011
var b: UInt8 = 0b11100001

a.binary()
b.binary()
(a | b).binary()

a.binary()
b.binary()
(a & b).binary()

// XOR
a.binary()
b.binary()
(a ^ b).binary()

a.binary()
(~a).binary()

// reading
a.binary()
b = 0b00010001
b.binary()
(a & b).binary()

// installation
b = 0b00000010
a.binary()
b.binary()
(a | b).binary()

// inverse
a.binary()
b.binary()
(a ^ b).binary()

//  reset
b = 0b00010000
a.binary()
(~b).binary()
(a ^ ~b).binary()


enum CheckList : UInt8 {
    case Bread =  0b00000001
    case Chiken = 0b00000010
    case Apples = 0b00000100
    case Pears =  0b00001000
    
}


let checkList : UInt8 = 0b00001001

let bread = checkList & CheckList.Bread.rawValue
bread.binary()


let chiken = checkList & CheckList.Chiken.rawValue
chiken.binary()

let pears = checkList & CheckList.Pears.rawValue
pears.binary()
*/
