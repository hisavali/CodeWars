//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//str.replaceSubrange(str.startIndex..<3, with:["ool"])
//days.replaceSubrange(1..<3, with: ["1", "2"]) // Replace 1st & 2nd index elements.

str = String(str.dropLast(1))
str = String(str.dropFirst(2))
//str
str.replaceSubrange(str.startIndex..<str.endIndex, with:"oo")

//str[3] = "d"  // CAN NOT ASSIGN using SUBSCRIPT as it is read only

// Iterating over string
for i in 0..<str.count {
    type(of: i)
    let range = str.index(str.startIndex, offsetBy:i)
    str[range]
}

str.forEach { c in 
    print (c)
    if c == "o" {
        return // DOESN'T RETURN the forEach rather it only comes out of current block
    }
}

let iterator = "world".makeIterator()
for i in iterator {
    type(of : i)
    print (i)
}

// Ranges
str = "Hello, playground"
let range = str.index(str.startIndex,offsetBy: 1)
str[range]

let longerRange = str.index(str.startIndex, offsetBy: 3)..<str.index(str.endIndex, offsetBy:-2)
type(of: longerRange)
str[longerRange]

let d: String 
//str.subString()

let lc = Character("a")...Character("z")
lc.contains("d")

//for c in lc {
//    c
//}

let singleDigits = 0..<10

for i in singleDigits {
    print(i)
}

let single = "Pok\u{01ff}mon"
let double = "Pok\u{0065}\u{0301}mon"


let f = single.map { String($0) }
f.joined(separator: "")
type(of: f)



["a","b","cd"].contains { $0 == "c" }


["a","bc"].contains { s in
    //print ("\(type(of: s)) + \(s)")
    return ["bb","abc"].contains {
        //  print ("--" + $0)
        //return $0 == s
        return $0.contains(s)
    }
}


let r = ["a", "b"].filter { $0 != "b"}
r


let range1 = "abcd".range(of: "c")
print(range1!.lowerBound)
range1!.upperBound
