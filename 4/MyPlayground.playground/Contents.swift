import Foundation
var tuple : (statusCode: Int, message: String?, errorMessage: String?) =  (250, "Hey" , nil)

if (tuple.statusCode >= 200) && (tuple.statusCode < 300 ) {
    if tuple.message != nil {
        print(tuple.message!)
    } else {
        print("Error message")
    }
} else {
    if let someErroe = tuple.errorMessage{
        print(tuple.errorMessage)
    }
}


// 3 task

let student1 : (name: String? , carNumber: String?, grade: String?)
let student2 : (name: String? , carNumber: String?, grade: String?)
let student3 : (name: String? , carNumber: String?, grade: String?)
let student4 : (name: String? , carNumber: String?, grade: String?)
let student5 : (name: String? , carNumber: String?, grade: String?)

student1.name = "Bob"
student1.carNumber = nil
student1.grade = "A"

student2.name = "Sam"
student2.carNumber = "a123aa22"
student2.grade = nil

student3.name = "Sara"
student3.grade = nil
student3.carNumber = nil

student4.name = "Anton"
student4.carNumber = nil
student4.grade = nil

student5.name = "Alon"
student5.carNumber = "e223sc32"
student5.grade = "C"

if let name1 = student1.name {
    print(name1)
    if  student1.carNumber != nil {
        print(student1.carNumber!)
    }
    if let grade1 = student1.grade {
        print(grade1)
    }
}
    
if let name = student2.name {
    print(name)
    if  student1.carNumber != nil {
        print(student2.carNumber!)
    }
    if let grade1 = student2.grade {
        print(grade1)
    }
}

if let name1 = student3.name {
    print(name1)
    if  student3.carNumber != nil {
        print(student1.carNumber!)
    }
    if let grade1 = student3.grade {
        print(grade1)
    }
}

if let name1 = student4.name {
    print(name1)
    if  student4.carNumber != nil {
        print(student4.carNumber!)
    }
    if let grade1 = student4.grade {
        print(grade1)
    }
}

if let name1 = student5.name {
    print(name1)
    if  student5.carNumber != nil {
        print(student5.carNumber!)
    }
    if let grade1 = student5.grade {
        print(grade1)
    }
}

