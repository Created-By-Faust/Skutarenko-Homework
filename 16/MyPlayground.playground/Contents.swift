/* 1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У него есть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате
 2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
 Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически
 Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
 */

enum Direction {
    
    case Left
    case Right
    case Up
    case Down
}

class Person {
    
    var x : Int
    var y : Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
}

class Box {
    var x : Int
    var y : Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

func createDictionary(weight: Int, height: Int) -> [String : Int] {
    
    var dict = [String : Int]()
    
    for i in -1 ... weight {
        for j in -1 ... weight {
            if i == -1 || j == -1 || i == weight || j == height {
                dict["\(i):\(j)"] = 0 // black
            } else {
                dict["\(i):\(j)"] = 1 // white
            }
        }
    }
    
    return dict
}

class Room {
    
    let weight : Int
    let height : Int
    var typeCell = [String : Int]()
    
    let human = Person(x: 0, y:0)
    var box = Box(x: 2, y: 3)
    
    init(weight: Int, height : Int) {
        self.weight = weight
        self.height = height
        self.typeCell = createDictionary(weight: weight, height: height)
        self.typeCell["\(box.x):\(box.y)"] = 2 // box sell
    }
    
    
    
    func printRoom() {
        
        for i in -1 ... height {
            for j in -1 ... weight {
                
                if typeCell["\(i):\(j)"] == 0 {
                    print("◼️", terminator: " ")
                    continue
                }
                
                if i == box.x && j == box.y {
                    print("🎁", terminator: " ")
                    continue
                }
                
                if i == human.x && j == human.y  {
                    print("⛹🏾‍♂️", terminator: " ")
                } else {
                    print("◻️", terminator: " ")
                }
            }
            print()
        }
        print()
    }
    
    func goHuman(direction: Direction) -> Bool {
        
        switch direction {
            
        case .Up:
            if (human.x > 0 ) {
                
                human.x -= 1
                if (human.x == box.x && human.y == box.y) && (box.x >= 1) {
                    box.x -= 1
                    typeCell["\(box.x):\(box.y)"] = 2
                    typeCell["\(box.x + 1):\(box.y)"] = 1
                }
            
            }
            
        case .Down:
            if (human.x < height) {
                human.x += 1
                
                if (human.x == box.x && human.y == box.y) && (box.x + 1 <= height) {
                    box.x += 1
                    typeCell["\(box.x):\(box.y)"] = 2
                    typeCell["\(box.x - 1):\(box.y)"] = 1
                }
                
            }
            
        case .Left:
            if (human.y > 0 ) {
                human.y -= 1
                
                if (human.x == box.x && human.y == box.y) && (box.y >= 1) {
                    box.y -= 1
                    typeCell["\(box.x):\(box.y)"] = 2
                    typeCell["\(box.x):\(box.y + 1)"] = 1
                }
                
            }
            
        case .Right:
            if (human.y < weight ) {
                human.y += 1
                
                if (human.x == box.x && human.y == box.y) && (box.y + 1 <= weight) {
                    box.y += 1
                    typeCell["\(box.x):\(box.y)"] = 2
                    typeCell["\(box.x):\(box.y - 1)"] = 1
                }
            }
            
        }
        
        
        return true
    }
    
    func moveToPoint(x: Int, y: Int, flag : Bool) {
        
        
        
        if x > 9 || x < 1 || y > 9 || x < 1 {
            print("Don't found this point")
            return
        }
        
        
        let goX1 = box.x - human.x
        let goY1 = box.y - human.y
        
        
        if goX1 > 0 {
            for _ in 0 ..< goX1 {
                goHuman(direction: .Right)
            }
        } else {
            for _ in 0 ..< -goX1 {
                goHuman(direction: .Left)
            }
        }
        
        if goY1 > 0 {
            for _ in 1 ..< goY1 {
                goHuman(direction: .Down)
            }
        } else {
            for _ in 1 ..< -goY1 {
                goHuman(direction: .Up)
            }
        }
        
        if flag == false {
            return
        }
        
        typeCell["\(box.x)\(box.y)"] = 1
        box.x = x
        box.y = y
        typeCell["\(box.x)\(box.y)"] = 2
        
        
        moveToPoint(x: x, y: y, flag: false)
        
        
    }
    
    
        
        
 }


let room = Room(weight: 10, height: 10)

room.printRoom()

room.box

room.moveToPoint(x: 8, y: 8, flag: true)

room.box

room.printRoom()





/*
struct Point {
    
    var x : Int
    var y : Int
    
    mutating func moveByX(x: Int, andY y: Int) {
        
        self.x += x
        self.y += y
        
    }
}

enum Color {
    
    static func numberOfElements() -> Int {
        return 2
    }
    
    case White
    case Black
    
    mutating func invert() {
        if self == Color.White {
            self = Color.Black
        } else {
            self = Color.White
        }
    }
    static func print() {
        Swift.print("enum")
    }

}


var c = Color.White

c
c.invert()
c
c.invert()
c

Color.numberOfElements()




func move(point: inout Point, byX: Int, andY: Int) -> Point {
    
    point.x += byX
    point.y += andY
    
    return point
}

var p = Point(x: 1, y: 1)

p = move(point: &p, byX: 2, andY: 4)


p.moveByX(x: 5, andY: 7)


p
 */
