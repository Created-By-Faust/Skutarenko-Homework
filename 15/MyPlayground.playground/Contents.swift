
let myContent = "This is text in my file"

struct File {
    
    static var maxSize = 1024.0
    
    var size : Double {
        didSet {
            if size > File.maxSize {
                size = 0.0
            }
        }
    }
    
    var pathToFile : String
    
    var name : String
    
    
    var pathToFolder : String {
        return pathToFile + "/" + name
    }
    
    var type : Bool
    
    var content: String {
        return type == true ? myContent : "You don't have access"
    }
}

var file1 = File(size: 512, pathToFile: "/Desktop/Application", name: "myApp", type: true)

file1.pathToFolder
file1.content
file1.name
file1.type
file1.pathToFile

var file2 = File(size: 512, pathToFile: "/Desktop/Application/Swift", name: "myApp2", type: false)


file2.pathToFolder
file2.content
file2.name
file2.type




//MARK: task 2

enum Spectrum : Int {
    
    case Black = 0x000000
    case Red = 0xFF0000
    case White = 0xFFFFFF
    
    
    static let amount = 3
    static let firstColor = Spectrum.Black
    static let lastColor = Spectrum.White
}

print("Amount of colors = \(Spectrum.amount)")
print("First color = \(Spectrum.firstColor.rawValue)")
print("Last color = \(Spectrum.lastColor.rawValue)")


//MARK: task 3

class Human {
    
    static var count = 0
    
    static let minAge = 0
    static let maxAge = 100
    static let minLenght = 2
    static let maxLenght = 25
    static let minHeight = 40.0
    static let minWeight = 2.5
    
    
    let name : String
    let lastName : String
    let age : UInt
    let height : Float
    let weight : Float
    
    init (name: String, lastName: String, age: UInt, height: Float, weight: Float) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.height = height
        self.weight = weight
        
        Human.count += 1
    }
}

let human1 = Human(name: "Alex", lastName: "Smith", age: 30, height: 180, weight: 82)

Human.count

let human2 = Human(name: "Jaden", lastName: "Barry", age: 20, height: 170, weight: 70)

Human.count

human1.weight

human1.lastName


/*
let MaxNameLenght = 50

class Human {
    
    var name: String {
        
        didSet {
            if name.count > MaxNameLenght {
                name = oldValue
            }
        }
    }
    
    lazy var storyOfMyLife : String? = "This is a story of my entire life..."
        
    static var maxAge = 100
    
    var age: Int {
        didSet {
            if age > Human.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

enum Direction {
    
    static let enumDescription = "Directions in the game"
    
    case Left
    case Right
    case Top
    case Botton
    
    var isVertical : Bool {
        return self == .Top || self == .Botton
    }
    
    var isHorizontal : Bool {
        return !isVertical
    }
        
}

Direction.enumDescription

let d = Direction.Right

d.isVertical
d.isHorizontal

struct Cat {
    
    var name: String {
        
        didSet {
            if name.count > MaxNameLenght {
                name = oldValue
            }
        }
    }
    
    static let maxAge = 20
    
    static var totalCats = 0
    
    var age: Int {
        
        didSet {
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
        Cat.totalCats += 1
    }
    
    
}

let human = Human(name: "Peter", age: 40)

human
human.storyOfMyLife
human

var cat = Cat(name: "Whiten", age: 10)

human.age = 1000
cat.age = 50

Cat.totalCats


var cat1 = Cat(name: "kodf", age: 4)
var cat2 = Cat(name: "Whifdlten", age: 6)

Cat.totalCats

cat.name = "dksnknskfndknfkdsss"


*/
