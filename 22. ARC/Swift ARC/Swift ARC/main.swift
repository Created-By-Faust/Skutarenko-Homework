/* Рассмотрим такую ситуацию: есть семья - папа, мама и дети.
 Папа глава семьи, у него есть Мама, Мама контролирует детей, т.е. иерархия: Папа - Мама - Дети, Дети на одном уровне.
 Дети могут вызывать друг друга и они могут искать пути, как общаться с другими Детьми, например говорить "дай игрушку", спрашивать Маму: "Мама, дай конфетку", общаться с Папой: "Папа, купи игрушку".
 Вся эта иерархия лежит в объекте класса Семья, у которого есть методы, например распечатать всю Семью, т.е. метод вернёт массив всех членов Семьи.
 У Папы есть 3 кложера (closures) - 1. когда он обращается к Семье - распечатать всю Семью, 2. распечатать Маму, 3. распечатать всех Детей.
 */


import Foundation

class Human {
    var name : String
    
    init(name: String) {
        self.name = name
    }
}

class Father : Human {
    
    var wife : Mother!
    weak var family : Family!
    var kids : [Kids]!
    
    lazy var MyFamily : () -> () =  {
        [unowned self] in
        self.family.printFamily()
    }
    
    lazy var myWife : () -> ()  = {
        [unowned self] in
        print("my wife \(wife.name)")
    }
    
    lazy var myKids : () -> () = {
        [unowned self] in
        print("my kids:")
        for kid in kids {
            print(kid.name)
        }
    }
    
    func keepToy() {
        print("\(name): keep toy")
    }
    func keepMoney() {
        print("\(name): keep money")
    }
    func whereIsMyFood() {
        print("\(name): \(wife.name) where is my food?")
        wife.keepFood()
    }
    
    deinit {
        print("Dad was deinizialized")
    }
    
}

class Mother : Human {
    
    weak var husband : Father!
    var kids : [Kids]!
    
    func keepCandy() {
        print("\(name): keep candy")
    }
    func whereIsMyMoney() {
        print("\(name): \(husband.name) where is my money?")
        husband.keepMoney()
    }
    func keepFood() {
        print("\(name): \(husband.name) keep your food")
    }
    
    deinit {
        print("Mom was deinizialized")
    }
}

class Kids : Human {
    
    weak var mother : Mother!
    weak var father : Father!
    
    
    func giveMeToy() {
        for kid in mother.kids {
            if kid !== self {
                print("\(self.name): \(kid.name) give me toy!")
                print("\(kid.name): \(self.name) keep toy!")
            }
        }
    }
    func giveCandy() {
        print("\(name): \(mother.name) give candy!")
        mother.keepCandy()
    }
    func buyToy() {
        print("\(name): \(father.name) buy toy!")
        father.keepToy()
    }
    
    
    deinit {
        print("Kid was deinizialized")
    }
}

class Family {
    
    let father : Father
    let mother : Mother
    var kids : [Kids]
    
    init(father: Father, mother: Mother, kids: [Kids]) {
        
        self.father = father
        self.mother = mother
        self.kids = kids
        
        for kid in kids {
            kid.mother = mother
            kid.father = father
        }
        
        self.mother.kids = kids
        self.mother.husband = father
        
        self.father.wife = mother
        self.father.kids = kids
        self.father.family = self
        
        
    }
    
    func printFamily() {
        print("----------------------")
        print("Father: \(father.name)")
        print("Mother: \(mother.name)")
        for kid in kids{
            print("Kid: \(kid.name)")
        }
        
        
    }
    
}

if true {
    let f = Family(father: Father(name: "Ken"), mother: Mother(name: "Olga"), kids: [Kids(name: "Max"), Kids(name: "Jasper")])
    
    f.father.myWife()
    f.father.MyFamily()
    f.father.myKids()
    f.father.whereIsMyFood()
    /*
    f.mother.whereIsMyMoney()
    
    for child in f.mother.kids {
        child.giveMeToy()
        child.giveCandy()
        child.buyToy()
    }
    */
}




/*
var playground = true

class Student {
    
    //weak var teacher : Teacher?
    unowned let teacher : Teacher
    
    
    deinit{
        print("goodbye student")
    }
    
    init(teacher : Teacher) {
        self.teacher = teacher
    }
}

class Teacher {
    
    var student : Student!
    
    var test : ( () -> () )?
    
    lazy var test2 : (Bool) -> () = { [unowned self] (a: Bool) in

        print(self.student)
    }
    
    init() {
        student = Student(teacher: self)
    }
    
    deinit{
        print("goodbye teacher")
    }
    
}

var closure : (() -> ())?




if playground {
    
   // var t : Teacher?
    var teacher = Teacher()
    teacher.test2(true)
    
    /*
    
    teacher.test = {
        [unowned teacher] in
        print(teacher)
    }
     
     */
    
  /*
    if playground {
        var student = Student(teacher: teacher)
        teacher.student = student

    }*/
    /*
    var student = teacher.student
    closure = {
        [weak student] in
        print(student)
    }
     */
    print("exit playground")
     
}

var x = 10
var y = 20

class Human {
    var name = "a"
}

var h = Human()



var closure3 : () -> () = {
    [x] in
    print("\(x) \(y)")
}

var closure2 : (Int) -> Int = { [x,y, h] (a: Int) -> Int in
    print("\(x) \(y) \(h.name)")

    return a
    
}

closure2(1)

x = 30
y = 40
h = Human()
h.name = "b"

closure2(1)





print("end")
*/
