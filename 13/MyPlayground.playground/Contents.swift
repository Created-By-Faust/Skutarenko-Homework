
//MARK: task 1
struct Student {

    var name: String
    var surname: String
    var yearOfBirth : Int
    var gpa: Float
}

let student1 = Student(name: "Bob", surname: "Aleev", yearOfBirth: 1998, gpa: 4.3)
let student2 = Student(name: "Alex", surname: "Aleev", yearOfBirth: 2000, gpa: 4.0)
let student3 = Student(name: "Chris", surname: "Heria", yearOfBirth: 2001, gpa: 3.3)
let student4 = Student(name: "Zen", surname: "Bishop", yearOfBirth: 1999, gpa: 3.8)
let student5 = Student(name: "Tim", surname: "Letov", yearOfBirth: 2000, gpa: 4.5)

var jurnal = [student1, student2, student3, student4, student5]

//MARK: task 2
func printJurnal(array: [Student]) {
    var k = 1
    for student in array {
        print("\(k). \(student.surname) \(student.name) , year of birth: \(student.yearOfBirth) , GPA: \(student.gpa)")
        k += 1
    }
}

print("Task 2:")
printJurnal(array: jurnal)
print()

//MARK: task 3

jurnal = jurnal.sorted(by: {$0.gpa > $1.gpa} )
print("Task 3:")
printJurnal(array: jurnal)

//MARK: task 4

print()
print("Task 4:")

func sortBySurname(student1: Student, student2: Student) -> Bool {
    
    if student1.surname != student2.surname {
        return student1.surname < student2.surname
    } else {
        if student1.name != student2.name {
            return student1.name < student2.name
        }
    }
    return true
}


jurnal = jurnal.sorted(by: sortBySurname)

printJurnal(array: jurnal)

//MARK: task 5
print()
var jurnalCopy = jurnal

jurnalCopy[0].surname = "AAs"
jurnalCopy[0].gpa = 2.0
jurnalCopy[1].name = "sds"
jurnalCopy[1].yearOfBirth = 2004
jurnalCopy[3].name = "dsdc"
jurnalCopy[4].gpa = 2.4

print("jurnal:")
printJurnal(array: jurnal)

print("copy jurnal:")
printJurnal(array: jurnalCopy)

// jurnal has not changed because jurnalCopy - copy jurnal, but they don't connecte


//MARK: task 6, task 1-5 with class


class StudentClass {
    
    var name: String
    var surname: String
    var yearOfBirth : UInt
    var gpa: Float
    
    init (name: String, surname: String,  yearOfBirth: UInt, gpa: Float ) {
        
        self.name = name
        self.surname = surname
        self.yearOfBirth = yearOfBirth
        self.gpa = gpa
    }
}

let studentSC1 = StudentClass(name: "Bob", surname: "Aleev", yearOfBirth: 1998, gpa: 4.3)
let studentSC2 = StudentClass(name: "Alex", surname: "Aleev", yearOfBirth: 2000, gpa: 4.0)
let studentSC3 = StudentClass(name: "Chris", surname: "Heria", yearOfBirth: 2001, gpa: 3.3)
let studentSC4 = StudentClass(name: "Zen", surname: "Bishop", yearOfBirth: 1999, gpa: 3.8)
let studentSC5 = StudentClass(name: "Tim", surname: "Letov", yearOfBirth: 2000, gpa: 4.5)

var jurnalWithClasses = [studentSC1, studentSC2, studentSC3, studentSC4, studentSC5]

func printClassJurnal(array: [StudentClass]) {
    var k = 1
    for student in array {
        print("\(k). \(student.surname) \(student.name) , year of birth: \(student.yearOfBirth) , GPA: \(student.gpa)")
        k += 1
    }
}
print()
print("Classes task 2:")
printClassJurnal(array: jurnalWithClasses)


print()
print("Classes task 3:")

jurnalWithClasses = jurnalWithClasses.sorted(by: {$0.gpa > $1.gpa} )
printClassJurnal(array: jurnalWithClasses)

print()
print("Classes task 4:")

func sortBySurname(student1: StudentClass, student2: StudentClass) -> Bool {
    
    if student1.surname != student2.surname {
        return student1.surname < student2.surname
    } else {
        if student1.name != student2.name {
            return student1.name < student2.name
        }
    }
    return true
}


jurnalWithClasses = jurnalWithClasses.sorted(by: sortBySurname )
printClassJurnal(array: jurnalWithClasses)

print()
print("Classes task 5:")


var jurnalCopy2 = jurnalWithClasses

jurnalCopy2[0].surname = "AAs"
jurnalCopy2[0].gpa = 2.0
jurnalCopy2[1].name = "sds"
jurnalCopy2[1].yearOfBirth = 2004
jurnalCopy2[3].name = "dsdc"
jurnalCopy2[4].gpa = 2.4

print("jurnal classes:")
printClassJurnal(array: jurnalWithClasses)

print("copy jurnal classes:")
printClassJurnal(array: jurnalCopy2)

// jurnalWithClasses has changed because jurnalCopy2 = jurnalWithClasses . they are connecting 


/*
/*
let student1 = (name: "Alex", age: 20)
let student2 = (name: "Bob", age: 22)

student1.name
student2.name

let student3 = (nam: "Sam", ag: 23)

student3.ag
*/


class StudentClass {
    
    var name : String
    var age : Int
    
    init() {
        name = "NO name"
        age = 20
    }
    
    init (name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}

struct StudentStruct {
    
    var name : String
    var age : Int
}

func addOneYear(student: StudentClass) {
    student.age += 1
}

func addOneYear(student: inout StudentStruct) {
    student.age += 1
}

let stClass = StudentClass(name: "Bob", age: 18)

stClass.name = "Alex"
stClass.age

stClass.name

var stStruct1 = StudentStruct(name: "Alex", age: 18)

//stStruct1.age = 21

stStruct1

var stStruct2 = stStruct1

stStruct2.age  = 25
stStruct2.name = "Sam"

stStruct2
stStruct1

var stClass2 = stClass

stClass2.age = 20
stClass2.name = "AAA"

stClass2
stClass
addOneYear(student: stClass)
stClass


stStruct1

addOneYear(student:  &stStruct1)

stStruct1

var arrayStructs = [stStruct1]

arrayStructs[0]
arrayStructs[0].age = 59
arrayStructs[0]

stStruct1

var arrayClasses = [stClass]

arrayClasses[0]
arrayClasses[0].age = 50
arrayClasses[0]

stClass

*/
