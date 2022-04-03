
/*
 1. Повторить код Алексея из урока по памяти.
 2. Для этого же студента добавить свойства:
 -дата рождения (используя другую структуру)
 -возраст (вычисляется на основании даты рождения)
 -количество лет учебы (начиная с 6 лет, либо 0 если возраст меньше чем 6)
 3. Создать структуру "отрезок", у которой два свойства - точка "А" и точка "В", которые в свою очередь тоже структуры (не стандартные, а наши собственные)
 Также отрезок имеет вычисляемые свойства (они изменяют точки "А" и "В", если мы изменяем следующие свойства):
 -midPoint - середина отрезка (при её изменении, отрезок смещается на параллельную прямую, проходящую через наш midPoint?)
 -длина отрезка (при изменении, точка "А" остается, а точка "В" движется)
 */

import Foundation


struct DateOfBirth {
    
    let day: UInt
    let month: UInt
    let year: UInt
        
}

let now : (day: UInt, month: UInt, year: UInt) = (day: 1, month: 4, year: 2022)

struct Student {
    var firstName: String {
        
        didSet {
            
            firstName.localizedCapitalized
            print("did set \(firstName) instead of \(oldValue)")
        }
    }
    
    var lastName: String {
        
        didSet {
            
            lastName.localizedCapitalized
        }
    }
    
    var fullName: String {
        
        get {
            return  lastName + " " + firstName
        }
        set {
            print("fullName wants to be set to " + newValue)
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstName = words[0]
            }
            
            if words.count > 1 {
                firstName = words[1]
            }
        }
    }
    
    var dateOfBirth: DateOfBirth
    
    var age: UInt {
        
        return now.year - dateOfBirth.year + ((now.day >= dateOfBirth.day) && (now.month >= dateOfBirth.month) ? 1 : 0)
    }
    
    var yearsOfStydy: Int {
        
        if age < 6 {
            return 0
        } else {
            return Int(age) - 6
        }
    }
}

let dob1 = DateOfBirth(day: 20, month: 02, year: 2002)
let studen1 = Student(firstName: "Alex", lastName: "Samenkov", dateOfBirth: dob1)

studen1.age
studen1.dateOfBirth
studen1.yearsOfStydy

//MARK: task 3
/*Создать структуру "отрезок", у которой два свойства - точка "А" и точка "В", которые в свою очередь тоже структуры (не стандартные, а наши собственные)
Также отрезок имеет вычисляемые свойства (они изменяют точки "А" и "В", если мы изменяем следующие свойства):
-midPoint - середина отрезка (при её изменении, отрезок смещается на параллельную прямую, проходящую через наш midPoint?)
-длина отрезка (при изменении, точка "А" остается, а точка "В" движется)
*/

struct Point {
    
    let x: Double
    let y: Double
}

struct Line {
    var a: Point
    var b: Point
    
    var midPoint: Point {
        
        set {
            let deltaX = (newValue.x - midPoint.x)
            let deltaY = (newValue.y - midPoint.y)
            a = Point(x: a.x + deltaX , y: a.y +  deltaY)
            b = Point(x: b.x + deltaX , y: b.y + deltaY )
            
        }
        get {
            return Point(x: (a.x + b.x) / 2, y: (a.y + b.y) / 2)
        }
    }
    var length: Double {
        
        get {
            return sqrt( pow(b.x - a.x, 2) + pow(b.y - a.y, 2) )
        }
        
        set {
            b = Point(x: a.x + (b.x - a.x)*newValue/length, y: a.x + (b.y - a.y)*newValue/length)
        }
    }
}

var line1 = Line(a: Point(x: 0, y: 0), b: Point(x: 2, y: 2))



line1.midPoint
line1.length
line1.b

line1.midPoint = Point(x: 2, y: 2)

line1.a
line1.b
line1.midPoint


line1.length = 5
line1.a
line1.b
line1.midPoint


/*
 
import Foundation

struct Student {
    var firstName: String {
        
        willSet{
            print("will set " + newValue + " instead of " + firstName)
        }
        didSet {
            print("did set " + firstName + " instead of " + oldValue)
            
            firstName = firstName.localizedCapitalized
        }
    }
    
    var lastName: String {
        
        didSet {
            
            lastName = lastName.localizedCapitalized
        }
    }
    
    var fullName: String {
        
        get {
            return firstName + " " + lastName
        }
        
        set {
            print("fullName wants to be set to " + newValue)
            
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstName = words[0]
                
            }
            
            if words.count > 1 {
                lastName = words[1]
            }
        }
       
    }
}
    

var student = Student(firstName: "Alex", lastName: "Skutarenko")

student.firstName
student.lastName
student.fullName

student.firstName = "Bob"

student.firstName
student.lastName
student.fullName

student.fullName = "iVan iVAnov"

student.fullName

student.firstName
student.lastName
student.fullName

*/
