
let str1 = "122"
let str2 = "12"
let str3 = "12sd"
let str4 = "dw"
let str5 = "sdf"
var sum = 0

let s1 = Int(str1) ?? 0
let s2 = Int(str2) ?? 0
let s3 = Int(str3) ?? 0
let s4 = Int(str4) ?? 0
let s5 = Int(str5) ?? 0

sum = s1 + s2 + s3 + s4 + s5

print("result interpolation: \(s1) + \(s2) + \(s3) + \(s4) + \(s5) = \(sum)")

let ss1 = (Int(str1) == nil) ? "nil" : str1
let ss2 = (Int(str2) == nil) ? "nil" : str2
let ss3 = (Int(str3) == nil) ? "nil" : str3
let ss4 = (Int(str4) == nil) ? "nil" : str4
let ss5 = (Int(str5) == nil) ? "nil" : str5

let sumString = ss1 + " + " + ss2 + " + " + ss3 + " + " + ss4 + " + " + ss5 + " = " + "\(sum)"
print("result concatenation: " + sumString)


let uniStr = "\u{2720}\u{2721}\u{2190}\u{2740}\u{288}"

let unuStrLength = uniStr.count
let alphabet = "abcdefghjklmnpqrstuvwxyz"

let char :Character = "d"
var k = 0

for c in alphabet {
    if c == char {
        break
    }
    k+=1
}
print("char number in aphabet is \(k)")

/*
//var str = String()

var str = "c"

str = str + "a"
str += "b"
/*
var a = 5
var b = a
 
b
*/

var str1 = "a"
var str2 = str1

str1
str2

//str1 = "b"

str1
str2

str1.isEmpty

let char1 : Character = "x"

for char in "hello world"{
    print(char)
}

str1.append(char1)

str1

let heart = "\u{1F496}"

var fun : Character = "ъ\u{301}\u{20dd}"

let funString = "what is this? -> \(fun)"

funString
funString.count

if funString == "aa"{
    
} else {
    print("not equel")
}

funString.hasPrefix("what")
funString.hasSuffix("ъ")

*/
