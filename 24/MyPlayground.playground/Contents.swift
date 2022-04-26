import Foundation

extension Int {
    
    var isPositive : Bool {
        return self > 0
    }
    
    var isNegative : Bool {
        return self < 0
    }
    
    var countSymbol : Int {
        return String(self).count
    }
    
    subscript(index : Int) -> Int? {
        
        if index < 0 || index > self.countSymbol - 1 {
            return nil
        }
        return abs(self) / Int(pow(Double(10), Double(index))) % 10
    }
}
let a = -8245

a.isNegative
a.countSymbol
a[0]
a[1]
a[2]
a[3]
a[4]
a[-1]

/*
 4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его
*/
extension String {
        
    subscript(range: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: range.startIndex)
            let endIndex = self.index(startIndex, offsetBy: range.endIndex - range.startIndex)
            return String(self[startIndex ..< endIndex])
        }
        set{
            let startIndex = self.index(self.startIndex, offsetBy: range.startIndex)
            let endIndex = self.index(startIndex, offsetBy: range.endIndex - range.startIndex)
            self.replaceSubrange(startIndex ..< endIndex, with: newValue)
        }
    }
}

var str1 = "Hello, my friend"
let str2 = str1[0 ..< 5]
str1[0 ..< 5] = "Ollah"
str1[0..<3] = "K"
str1


/*
 5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие:

 let s = "Hi hi hi"

 s.truncate(4) // Hi h...

 s.truncate(10) // Hi hi hi
 */
 
extension String {
    func truncate(lenght: Int) -> String {
        if lenght < self.count {
            return self[0 ..< lenght] + "..."
        }
        
        return self 
    }
}

var str3 = "abcdefgh"
str3.truncate(lenght: 3)
str3.truncate(lenght: 100)

str3
let str5 = "Hi hi hi"

str5.truncate(lenght: 4)
str5.truncate(lenght: 10)
str5.truncate(lenght: 0)
str5

/*
extension Int {
    
    var isEven : Bool {
        return self % 2 == 0
    }
    
    var isOdd : Bool {
        return !isEven
    }
    
    enum EvenOrOdd {
        case Even
        case Odd
    }
    
    var evenOrIdd : EvenOrOdd {
        return isEven ? .Even : .Odd
    }
    
    func pow(value: Int) -> Int {
        
        var temp = self
        for _ in 1 ..< value {
            temp *= self
        }
        return temp
    }
    
    mutating func powTo(value: Int) {
        self = pow(value: value)
    }
    
    var binaryString : String {
        
        var result = ""
        for i in 0 ..< 8 {
            result = String(self & (1 << i) > 0) + result
        }
        
        return result
    }
}

extension String {
    init(_ value: Bool) {
        self.init(value ? 1 : 0)
    }
    
    subscript(start: Int, lenght: Int) -> String {
            let start = self.index(self.startIndex, offsetBy: start)
            let end = self.index(self.startIndex, offsetBy: lenght)
            return String(self[start..<end])
        }
}

extension Int.EvenOrOdd {
    var string : String {
        switch self {
        case .Even: return "even"
        case .Odd: return "odd"
        }
    }
}

var a = 5

if a % 2 != 0 {
    print("a")
}

if a.isOdd {
    print("a")
}



a.evenOrIdd.string


a.pow(value: 4)

a.powTo(value: 4)
a

a = 5
a.binaryString


let s = "Hello, World!"

let start = s.startIndex
let end = s.index(start, offsetBy: 6)
s[start ..< end]


*/
