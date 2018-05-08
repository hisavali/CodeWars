//: [Previous](@previous)

import Foundation

// Given a number, return a string with dash'-'marks before and after each odd integer, but do not begin or end the string with a dash mark.


func dashatize(_ n:Int) -> String {

    let sn = String(abs(n)) // if n < 0
    let next = sn.map { Int(String($0))! % 2 == 1 ? "-\($0)-" : String($0) }.joined()
    return next.replacingOccurrences(of: "--", with: "-")
        .trimmingCharacters(in: CharacterSet(charactersIn: "-"))
}

dashatize(-123745)

//var d = "1234".map ({ String($0) })
//Mirror(reflecting:d).subjectType
//print(d)
////print(d.joined(separator:"-"))
//
//let cast = ["Vivien", "Marlon", "Kim", "Karl"]
//
//Mirror(reflecting: cast).subjectType
//let list = cast.joined(separator: ", ")
//print(list)

let ae = ["AC", "CA"]
type(of: ae)

let b = ae.flatMap { $0 }
type(of: b)
b

let c = ae.map { $0 }
type(of: c)
c


