
//MARK: task 1


class Artist {
    
    var name : String
    var surname : String
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    func perfomance() {
        print("Perform \(name) \(surname)", terminator: " ")
    }
}

class Dancer : Artist {
    
    override func perfomance() {
        super.perfomance()
        print("- dance")
    }
}

class Singer : Artist {
    
    override func perfomance() {
        super.perfomance()
        print("- song")
    }
}

class Painter : Artist {
    override func perfomance() {
        super.name = "Abra"
        super.perfomance()
        print("- draw")
    }
}

let artist1 = Dancer(name: "Alex", surname: "Vitte")
let artist2 = Singer(name: "John", surname: "Len")
let artist3 = Painter(name: "Andrey", surname: "Samen")

var artists = [artist1, artist2, artist3]

for a in artists {
    a.perfomance()
}

//MARK: task 2

enum Types : String {
    case Plane = "Plane"
    case Ship = "Ship"
    case Helicopter = "Helicopter"
    case Car = "Car"
    case Train = "Train"
}

class Vehicle {
    
    var type : Types
    
    init(type: Types) {
        self.type = type
    }
    
    var speed : Int {
        return 0
    }
    var capacity : Int {
        return 0
    }
    var cost : Int {
        return 0
    }
    
    func getType() -> String {
        return type.rawValue
    }
    
    func calculate(distance : Int, amount: Int) {
        
        let count = amount > capacity ? Int(Double(amount)/Double(capacity)) * 2 : 1
        
        var allTime: Double = Double(distance) / Double(speed) * Double(count)
        let money = amount * cost * distance
        print(type.rawValue + ":")
        print("number of round trips : \(count)")
        print("all time : \(allTime) hours")
        print("total cost : \(money)💲")
        print()
        
    }
  
}

class Plane : Vehicle {
    
    override var speed : Int {
        return 1000
    }
    override var capacity : Int {
        return 180
    }
    override var cost : Int {
        return 300
    }
}

class Ship : Vehicle {
    
    override var speed : Int {
        return 50
    }
    override var capacity : Int {
        return 250
    }
    override var cost : Int {
        return 500
    }
}

class Helicopter : Vehicle {
    
    override var speed : Int {
        return 200
    }
    override var capacity : Int {
        return 5
    }
    override var cost : Int {
        return 3000
    }
}

class Car : Vehicle {
    
    override var speed : Int {
        return 100
    }
    override var capacity : Int {
        return 5
    }
    override var cost : Int {
        return 50    }
}

class Train : Vehicle {
    
    override var speed : Int {
        return 120
    }
    override var capacity : Int {
        return 1000
    }
    override var cost : Int {
        return 250
    }
}

let plane = Plane(type: .Plane)
let ship = Ship(type: .Ship)
let car = Car(type: .Car)
let helicopter = Helicopter(type: .Helicopter)
let train = Train(type: .Train)

let transport = [plane, ship, car, helicopter, train]

for tr in transport {
    tr.calculate(distance: 250, amount: 100)
}



//MARK: task 3
//люди, крокодилы, обезьяны, собаки, жираф
enum Types2 {
    case Human
    case Crocodile
    case Monkey
    case Dog
    case Giraffe
    
}

class Parent {
    
    let type : Types2
    
    static var twoLegsCount = 0
    static var fourLegsCount = 0
    static var animalCount = 0
    static var reptiles = 0
    
    var count : Int {
        return Parent.twoLegsCount + Parent.fourLegsCount
    }
    
    init(type: Types2) {
        self.type = type
        
        if type == .Human {
            Parent.twoLegsCount += 1
        }
        
        if type == .Monkey {
            Parent.twoLegsCount += 1
            Parent.animalCount += 1
        }
        
        if type == .Crocodile {
            Parent.fourLegsCount += 1
            Parent.reptiles += 1
        }
        
        if type == .Dog {
            Parent.fourLegsCount += 1
            Parent.animalCount += 1
        }
        
        if type == .Giraffe {
            Parent.fourLegsCount += 1
            Parent.animalCount += 1
        }
        
    }
    
    func amountOfReptiles() {
        print("amount of reptiles : \(Parent.reptiles)")
        
    }
    func haveOfTwoLegs() {
        print("have two legs: \(Parent.twoLegsCount)")
    }
    func haveOfFourLegs() {
        print("have four legs: \(Parent.fourLegsCount)")
    }
    func amountOfAnimals() {
        print("amount of animals : \(Parent.animalCount)")
    }
    func amountOfAlive() {
        print("alive creatures: \(count)")
    }
}

class Human : Parent {}
class Monkey : Parent {}
class Crocodile : Parent {}
class Dog : Parent {}
class Giraffe : Parent {}

let human1 = Human(type: .Human)
let human2 = Human(type: .Human)
let monkey1 = Monkey(type: .Monkey)
let monkey2 = Monkey(type: .Monkey)
let monkey3 = Monkey(type: .Monkey)
let giraffe = Giraffe(type: .Giraffe)
let giraffe2 = Giraffe(type: .Giraffe)
let crocodile1 = Crocodile(type: .Crocodile)
let crocodile2 = Crocodile(type: .Crocodile)
let dog1 = Dog(type: .Dog)
let dog2 = Dog(type: .Dog)

let array2 : [Parent] = [human1, human2, monkey1, monkey2, monkey3, giraffe, giraffe2, crocodile1, crocodile2, dog1, dog2]

human2.amountOfReptiles()
human2.haveOfFourLegs()
human2.amountOfAnimals()
human2.amountOfAlive()



/*
class Human {
    
    // final var/func/class ... - neither can override
    
    var firstName : String = ""
    var lastName : String = ""
    var fullName : String {
        return firstName + " " + lastName
    }
    
    func sayHello() -> String {
        return "Hello"
    }
}

class SmartHuman : Human {
    
}

class Student : SmartHuman {
    
    override func sayHello() -> String {
        return super.sayHello() + " my friend!"
    }
}



class Kid :  Human {
    
    var favoriteToy : String = "Macbook"
    
    override func sayHello() -> String {
        return "agu"
    }
    
    
    override var firstName: String {
        set {
            super.firstName = newValue + " :)"
        }
        get {
            return super.firstName
        }
    }
    
    override var lastName: String {
        didSet {
            print("new value " + self.lastName)
        }
    }
    
    override var fullName: String {
        return firstName
    }
    
}




let human = Human()

human.firstName = "Alex"
human.lastName = "Skutarenko"
human.fullName
human.sayHello()


let student = Student()

student.firstName = "Max"
student.lastName = "Mix"
student.fullName
student.sayHello()


let kid = Kid()

kid.firstName = "A"
kid.lastName = "SKAnksn"
kid.sayHello()
kid.fullName
kid.firstName
kid.favoriteToy



let array = [kid, student, human] // : [Human]


for value in array {
    print(value.sayHello())
}

*/

