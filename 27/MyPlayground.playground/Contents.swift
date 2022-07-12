//  1. Создать протокол еда и метод taste( будет выводть просто вкусовые ощущения). создать массив продуктов(разных классов). Пройтись по всему массиву и вывести названия и поделить ощущениями. отсортировать продукты по имени и  откусить кусочек и поделиться ощущениями
//2. Создать протокол Storebol(наследуется от протокола Еда) . Функция сортировки в холодильник положить торлько сторебол. добавить булевое прорерти expired( если флаг тру то выбросить его). добавить daysToExpired и отсортировкать массив по количсеству дней, если количество дней совпадает то отсортировать ещё и по имени
// 3. те продукты которые были сторебол они были подписанные на протокол еда  холодильник должен принимать те элементы которые подписанны на 2 протокола сразу


//MARK: task 1

protocol FoodProtocol {
    
    var name : String { get }
    func taste() -> ()
}

protocol StorybolProtocol {
    
    var expired : Bool { get }
    var daysToExpired : Int { get }
}

class Apple : FoodProtocol, StorybolProtocol {
    
    var name: String
    
    func taste() {
        print("mmm, \(name) great!")
    }
    
    var expired: Bool
    
    var daysToExpired: Int
    
    init(name : String, expired : Bool, daysToExpired: Int) {
        
        self.name = name
        self.expired = expired
        self.daysToExpired = daysToExpired
    }
}

class Tomato : FoodProtocol, StorybolProtocol {
    
    var name: String
    
    func taste() {
        print("mmm, cool \(name)!")
    }
    
    var expired: Bool
    
    var daysToExpired: Int
    
    init(name : String, expired : Bool, daysToExpired: Int) {
        
        self.name = name
        self.expired = expired
        self.daysToExpired = daysToExpired
    }
}

class Chiken : FoodProtocol {
    
    var name: String
    
    func taste() {
        print("mmm, I love \(name)!")
    }
    
    init(name : String) {
        self.name = name
    }
}

class Milk : FoodProtocol, StorybolProtocol {
    
    var name: String
    
    var expired: Bool
    
    var daysToExpired: Int
    
    func taste() {
        print("mmm, Xueta! \(name)")
    }
    
    init(name : String, expired : Bool, daysToExpired: Int) {
        self.name = name
        self.expired = expired
        self.daysToExpired = daysToExpired
        
    }
}

class Dumpling : FoodProtocol {
    
    var name: String
    
    func taste() {
        print("mmm, \(name) Yam")
    }
    
    init(name : String) {
        self.name = name
    }
}


func printTaste(array : [AnyObject]) {
    
    for value in array {
        
        if let food = value as? FoodProtocol  {
            food.taste()
        }
    }
}


func putInRefrigirator(array : [AnyObject]) -> [FoodProtocol & StorybolProtocol] {
    
    var refrigirator = [FoodProtocol & StorybolProtocol]()
    
    for i in array {
        if let food = i as?  (StorybolProtocol & FoodProtocol) {
            if food.expired {
                refrigirator.append(food)
            }
        }
    }
    refrigirator.sort(by: {a, b in
        if a.daysToExpired == b.daysToExpired {
            return a.name < b.name
        } else {
            return a.daysToExpired < b.daysToExpired
        }
    })
    
    return refrigirator
}

func printRefrigirator(refrigirator : [FoodProtocol & StorybolProtocol]) {
    print("In refrigitaror:")
    for value in refrigirator {
        print("name: \(value.name)")
        print("expired : \(value.expired)")
        print("day to expired: \(value.daysToExpired)")
        print()
    }
}

let apple = Apple(name: "Apple", expired: true, daysToExpired: 12)
let chiken = Chiken(name: "Chiken")
let tomato = Tomato(name: "Tomato", expired: true, daysToExpired: 5)
let milk = Milk(name: "Milk", expired: true, daysToExpired: 7)
let frozenDumpling = Dumpling(name: "Dumpling")

var array : [AnyObject] = [apple, chiken, tomato, milk, frozenDumpling]

printTaste(array: array)

print()

let refrigiratorArray = putInRefrigirator(array: array)

printRefrigirator(refrigirator: refrigiratorArray)

/*
protocol Priority {
    var order : Int { get }
}

protocol EntryName : Priority {
    var label : String { get }
}




class Student : EntryName {
    
    var firstName : String
    var lastName : String
    
    var fullName : String {
        return firstName + " " + lastName
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var label : String {
        return fullName
    }
    let order = 1
    
}
class Animal {
    
}

class Cow : Animal, EntryName {
    var name : String?
    
    var label : String {
        return name ?? "a cow"
    }
    let order = 2
}

struct Grass : EntryName {
    var type : String
    
    var label : String {
        return "Grass: " + type
    }
    let order = 3
}

let student1 = Student(firstName: "Bob", lastName: "Shmob")
let student2 = Student(firstName: "Bill", lastName: "Shmill")
let student3 = Student(firstName: "Brian", lastName: "Shmian")

let cow1 = Cow()
cow1.name = "Burenka"
let cow2 = Cow()

let grass1 = Grass(type: "Bermuda")
let grass2 = Grass(type: "St. Augustine")

var array : [EntryName] = [cow1, student1, grass1, cow2, student3, grass2, student2]

/*
for value in array {
    
    /*
    if let grass = value as? Grass {
        print(grass.type)
    } else if let student = value as? Student {
        print(student.fullName)
    } else if let cow = value as? Cow {
        print(cow.name ?? "a cow")
    }*/
    
    switch value {
    case let grass as Grass: print(grass.type)
    case let student as Student: print(student.fullName)
    case let cow as Cow: print(cow.name ?? "just a cow")
    default: break
    }
}
*/

func printFarm(array: inout [EntryName]) {
    
    array.sort(by: {a, b in
        if a.order == b.order {
            return a.label.lowercased() < b.label.lowercased()
        } else {
            return a.order < b.order
        }
    })
    for value in array {
        
        print(value.label)
    }
}

printFarm(array: &array)
*/
