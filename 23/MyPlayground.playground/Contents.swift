import Darwin


class Human {
    
    var name : String

    var father : Man?
    var mother : Women?
    var brothers : [Man]?
    var sisters : [Women]?
    var kids : [Human]?
    var animals : [Animal]?
    
    init(name : String) {
        self.name = name
        sisters = []
        brothers = []
        kids = []
        animals = []
    }
    
    init(name: String , father: Man, mother: Women, brothers : [Man]?, sisters: [Women]?, kids: [Human]? ) {
        
        self.name = name
        self.father = father
        self.mother = mother
        self.brothers = brothers
        self.sisters = sisters
        self.kids = kids
        
        self.mother?.kids?.append(self)
        self.father?.kids?.append(self)
        
    }
    
    
    func myCousins() -> Int {
        
        var amount = 0
            
        if let brothers = father?.brothers {
            
            for bro in brothers {
                amount += bro.kids?.count ?? 0
            }
        }
        if let sisters = father?.sisters {
            for sis in sisters {
                amount += sis.kids?.count ?? 0
            }
        }
        
        if let brothers = mother?.brothers {
            
            for bro in brothers {
                amount += bro.kids?.count ?? 0
            }
        }
        if let sisters = mother?.sisters {
            for sis in sisters {
                amount += sis.kids?.count ?? 0
            }
        }
        return amount
    }
    func mySecondCousins() -> Int {
        
        var amount = 0
        
        if let grandgrandpaKids = father?.father?.father?.kids {
            
            for cousinsGrand in grandgrandpaKids {
                
                if let cousinsUnAn = cousinsGrand.kids {
                    
                    for UnAndAu in cousinsUnAn {
                        amount += UnAndAu.kids?.count ?? 0
                    }
                }
            }
        }
        
        if let grandgrandpaKids = mother?.father?.father?.kids {
            
            for cousinsGrand in grandgrandpaKids {
                
                if let cousinsUnAn = cousinsGrand.kids {
                    
                    for UnAndAu in cousinsUnAn {
                        amount += UnAndAu.kids?.count ?? 0
                    }
                }
            }
        }
        
        return amount
        
    }
    
    private func countUncle(human: Man) -> Int {
        
        var res = 0
        
        if let grandUncle = human.brothers {
            
            for grandUncl in grandUncle {
                if let grandUncleKids = grandUncl.kids {
                    
                    for kid in grandUncleKids {
                        if kid is Man {
                            res += 1
                        }
                    }
                }
            }
        }
        
        if let grandAunt = human.sisters {
            
            for grandAnt in grandAunt {
                if let grandAuntKids = grandAnt.kids {
                    
                    for kid in grandAuntKids {
                        if kid is Man {
                            res += 1
                        }
                    }
                }
            }
        }
        return res
    }
    
    private func countUncle(human: Women) -> Int {
        
        var res = 0
        
        if let grandUncle = human.brothers {
            
            for grandUncl in grandUncle {
                if let grandUncleKids = grandUncl.kids {
                    
                    for kid in grandUncleKids {
                        if kid is Man {
                            res += 1
                        }
                    }
                }
            }
        }
        
        if let grandAunt = human.sisters {
            
            for grandAnt in grandAunt {
                if let grandAuntKids = grandAnt.kids {
                    
                    for kid in grandAuntKids {
                        if kid is Man {
                            res += 1
                        }
                    }
                }
            }
        }
        return res
    }
    
    
    func myUncle() -> Int {
        
        var amount = 0
        
        if let uncle = father?.brothers {
            amount += uncle.count
        }
        
        if let uncle = mother?.brothers {
            amount += uncle.count
        }
        
        if let grandpa1 = father?.father {
            
            let granpaBroSisKids = countUncle(human: grandpa1)
            
            amount += granpaBroSisKids
        }
        
        if let grandpa2 = mother?.father {
            
            let granpaBroSisKids = countUncle(human: grandpa2)
            
            amount += granpaBroSisKids
        }
        
        if let grandma1 = father?.mother {
            
            let grandmaBroSisKids = countUncle(human: grandma1)
            
            amount += grandmaBroSisKids
        }
        
        if let grandma2 = mother?.mother {
            
            let grandmaBroSisKids = countUncle(human: grandma2)
            
            amount += grandmaBroSisKids
        }
        
        return amount
        
    }
    
    private func countAunt(human: Man) -> Int {
        
        var res = 0
        
        if let grandUncle = human.brothers {
            
            for grandUncl in grandUncle {
                if let grandUncleKids = grandUncl.kids {
                    
                    for kid in grandUncleKids {
                        if kid is Women {
                            res += 1
                        }
                    }
                }
            }
        }
        
        if let grandAunt = human.sisters {
            
            for grandAnt in grandAunt {
                if let grandAuntKids = grandAnt.kids {
                    
                    for kid in grandAuntKids {
                        if kid is Women {
                            res += 1
                        }
                    }
                }
            }
        }
        return res
    }
    private func countAunt(human: Women) -> Int {
        
        var res = 0
        
        if let grandUncle = human.brothers {
            
            for grandUncl in grandUncle {
                if let grandUncleKids = grandUncl.kids {
                    
                    for kid in grandUncleKids {
                        if kid is Women {
                            res += 1
                        }
                    }
                }
            }
        }
        
        if let grandAunt = human.sisters {
            
            for grandAnt in grandAunt {
                if let grandAuntKids = grandAnt.kids {
                    
                    for kid in grandAuntKids {
                        if kid is Women {
                            res += 1
                        }
                    }
                }
            }
        }
        return res
    }
    
    
    func myAunt() -> Int {
        
        var amount = 0
        
        if let aunt = father?.sisters {
            amount += aunt.count
        }
        
        if let aunt = mother?.sisters {
            amount += aunt.count
        }
        if let grandpa1 = father?.father {
            
            let granpaBroSisKids = countUncle(human: grandpa1)
            
            amount += granpaBroSisKids
        }
        
        if let grandpa2 = mother?.father {
            
            let granpaBroSisKids = countUncle(human: grandpa2)
            
            amount += granpaBroSisKids
        }
        
        if let grandma1 = father?.mother {
            
            let grandmaBroSisKids = countUncle(human: grandma1)
            
            amount += grandmaBroSisKids
        }
        
        if let grandma2 = mother?.mother {
            
            let grandmaBroSisKids = countUncle(human: grandma2)
            
            amount += grandmaBroSisKids
        }
        
        return amount
        
    }
    
    deinit {
        print("Me was deinizializate")
    }
}

class Man : Human {
    
    func moveSofa() {
        print("move the sova")
    }
    deinit {
        print("Man class was deinizializate")
    }
}
    
class Women : Human {
    
    func giveInstruct() {
        print("give instruct!")
    }
    deinit {
        print("Women class was deinizializate")
    }
}

class Animal {
    
    func voice() {
    }
}

class Parrot : Animal {
    override func voice() {
        print("Hi people")
    }
}

class Dog : Animal {
    override func voice() {
        print("Gahh Vahh")
    }
}

class Cat : Animal {
    override func voice() {
        print("Miay")
    }
}

let mother = Women(name: "Irina")
let father = Man(name: "Andrey")

//father.kids?.append(me)
//mother.kids?.append(me)

father
//father parents
let grandfather1 = Man(name: "Vladimir")
let grandmother1 = Women(name: "Galina")


father.father = grandfather1
father.mother = grandmother1

grandfather1.kids? += [father]

grandfather1
father.mother?.kids?.append(father)




// father bro
let uncle1 = Man(name: "Vladislav")
let uncle1Kids = [Man(name: "Roman"), Women(name: "Maria")]

uncle1.kids?.append(contentsOf: uncle1Kids)
uncle1.father = grandfather1
uncle1.mother = grandmother1
uncle1.brothers?.append(father)

father.brothers?.append(uncle1)

father.father?.kids?.append(uncle1)

// father grandpa bro
let grandUncle1 = Man(name: "Vasily")
let gUAunt1 = Women(name: "Alena")
let gUAunt2 = Women(name: "Natasha")
let guAuntKids = [Man(name: "Sasha")]

gUAunt1.kids?.append(contentsOf: guAuntKids)
grandUncle1.kids?.append(gUAunt1)
grandUncle1.kids?.append(gUAunt2)

grandfather1.brothers?.append(grandUncle1)


//mother parents
let grandfather2 = Man(name: "Alexsandr")
let grandmother2 = Women(name: "Nina")

mother.father = grandfather2
mother.mother = grandmother2
mother.father?.kids?.append(mother)
mother.mother?.kids?.append(mother)


//mather bro
let uncle2 = Man(name: "Alexey")
let uncle2Kids = [Human(name: "Andreey")]

uncle2.kids?.append(contentsOf: uncle2Kids)
uncle2.father = grandfather2
uncle2.mother = grandmother2
uncle2.sisters?.append(mother)

mother.brothers?.append(uncle2)

mother.father?.kids?.append(uncle2)

// mother grandma sis
let grandAunt2 = Women(name: "Zoe")
let gAAunt2 = Women(name: "Tatyana")
let gAAuntKids = [Man(name: "SashaV"), Man(name: "AndreyV")]

gUAunt2.kids?.append(contentsOf: gAAuntKids)
grandAunt2.kids?.append(gAAunt2)
grandmother2.sisters?.append(grandAunt2)



let me = Human(name: "Dmitry", father: father, mother: mother, brothers: nil, sisters: nil, kids: nil)


me.mother = mother
me.father = father


me.myCousins()
me.myUncle()
me.mySecondCousins()
me.myAunt()

/*
 //import Foundation
class Address {
    var street = " Deribasovskaya"
    var number = "1"
    var city = "Odessa"
    var country = "Ukraine"
}

struct Garage {
    var size = 2
}

class House {
    
    var rooms = 1
    var address = Address()
    var garage : Garage? = Garage()
}

class Car {
    var model = "Zaporojec"
    
    func start() {
        
    }
}

class Person {
    var cars : [Car]? //= [Car()]
    var house : House? //= House()
}

let p = Person()

//p.cars![0]
//p.house!

//p.house!.garage!.size

if let house = p.house {
    if let garage = house.garage {
        garage.size
    }
}

//p.house?.garage?.size = 3

if (p.house?.garage?.size = 3) != nil {
    print("upgrate!")
} else {
    print("failure!")
}

if let size = p.house?.garage?.size {
    size
}

//p.cars?[0].model

if p.cars?[0].start() != nil {
    print("start!")
} else {
    print("failure!")

}



//////////////////////

class Symboll {
    
}

class A : Symboll {
    
    func aa() {}
}

class B : Symboll {
    func bb() {}

}

//AnyObject
//Any

let array : [Any] = [A(), B(), Symboll(), A(), A(), B(), "a", 5, {() -> () in return}]

var aCount = 0
var bCount = 0
var sCount = 0

for value in array {
    if value is A {
        aCount += 1
    } else if value is B {
        bCount += 1
    } else /*if value is Symboll*/ {
        sCount += 1
    }
    if value is String {
        print("tada")
    }
    
    if let fun = value as? () -> () {
        print("tadaa")
        fun()
    }
    
    if let a = value as? A {
        a.aa()
    } else if let b = value as? B {
        b.bb()
    }
    
    //let a = value as A   // a!
    
    
}

aCount
bCount
sCount
*/
