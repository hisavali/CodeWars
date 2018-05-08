//: [Previous](@previous)

import Foundation

// Array Creation
var a: Array<Array<Int>> = [[1,2,3]]
var b = Array(repeating: 0, count:10)
var c: Array<Int> = [] //variable 'c' used before being initialized - Make sure to init before it's refererenced 

// Accesss
b.count
let empty = b.isEmpty
c.isEmpty

// First & last
print(c.first, c.last, separator:", ")

for i in a {
    for j in i {
        print ("\(j)  ")
    }
}

if let i = [10,20,30,40,50,60].index(of: 40) {
    print([10,20,30,40,50,60][..<i])
    print([10,20,30,40,50,60][...i])
    print([10,20,30,40,50,60][i...])
}

//---------------------------------------
//Adding & Removing 
a.append([4,5,6])
a.append(contentsOf:[[7,8,9]])
c.insert(5,at:0)
c.insert(contentsOf:[1,2,3,4], at:0)

c.remove(at: 0)
c.removeLast()
c.removeSubrange(1...2)

(0...4).count
(0..<4).count

//---------------------------------------
// Modifying copies of array containing primitive objects
var numbers = c
numbers[0] = 10 // Doesn't modify contents of `c`
c

//---------------------------------------
// Modifying copies of array containing reference objects 
class IntegerCounter {
    var counter = 10
}

var firstIntegers = [IntegerCounter(), IntegerCounter()]
var secondIntegers = firstIntegers

firstIntegers[0].counter = 100 // Property of instance modified
firstIntegers
secondIntegers

firstIntegers[0] = IntegerCounter() // Replace instance in source array doesn't change 2nd array
firstIntegers
secondIntegers

//---------------------------------------
// startIndex & endIndex are same if array is empty 
[].startIndex
[].endIndex


(0..<4).endIndex // returns `array.count` for last element
(0...4).endIndex // No index - PastEnd due to closed range

//(1..<4)[0]

let arry = [0,1,2,3]
arry[arry.endIndex - 1] //arry[arry.endIndex] crashes due to index-overflow 

//arry.index(after: arry.endIndex-1)
var days = ["sunday", "mon", "tue", "wed", "thu"]

if let dayIndex = days.index(days.startIndex, offsetBy: 3, limitedBy: days.endIndex) {
    days[dayIndex]
}

days.distance(from:days.startIndex,to:days.endIndex)
[].distance(from: [].startIndex, to:[].endIndex)

for i in stride(from: days.startIndex, to: days.endIndex, by: 3) {
    print ("At: \(i)  \(days[i])")
}

//Replace
days.replaceSubrange(1..<3, with: ["1", "2"]) // Replace 1st & 2nd index elements.
days.replaceSubrange(days.endIndex-1..<days.endIndex, with:["fri"])

// Don't remove but extract
days.suffix(2) // Returns final 2 elements of array
days.prefix(2) // Returns initial 2 elements of array
print(["1","2","a"].prefix(while: { Int($0) != nil })) // prefix(while:) once returns false doesn't call predicate


// Remove
days.dropLast(1)
[].dropLast(2)

days.append(contentsOf: ["thu","fri"])
days.dropFirst(2)

// Split
let message = "Let there be a   peace and hormony for all the living things in cosmos"
print(message.split(whereSeparator: { $0 == " "}).count)
print(message.split(whereSeparator: { $0 == " "}))
print(message.split(maxSplits: 2, whereSeparator: { $0 == " " }))
print(message.split(omittingEmptySubsequences: false, whereSeparator: { $0 == " "}))


// Sort
enum HTTPResponse {
    case ok
    case error(Int)
}

var responses:[HTTPResponse] = [.error(403),.error(402), .error(300), .ok, .error(302), .ok]

let sortedResponses = responses.sorted {
    switch ($0, $1) {
        case let (.error(aCode), .error(bCode)):
            return aCode < bCode
        case (.ok, .ok): 
            return false
        case (.error, .ok):
            return true
        case (.ok, .error):
            return false
    }
}

sortedResponses

var students = ["cc", "zzz", "xx", "a"]
students.sorted(by: <)

// Mutating sort
students.sort(by: <) // Sorting in place

responses.sort {
    switch ($0, $1) {
    case let (.error(aCode), .error(bCode)):
        return aCode < bCode
    case (.ok, .ok):
        return false
    case (.error, .ok):
        return true
    case (.ok, .error):
        return false
    }
}
responses

//Enumeration
for (index, element) in "swift".enumerated() {
    print ("Index: \(index) - \(element)")
}

let indices = "Swift".indices
for i in indices {
    print("\(i)  ")
}

let names: Set = ["ABC","ABC","CDE","DEF","EFG"]
var sortedIndices:[SetIndex<String>] = []
for (i, name) in zip(names.indices,names) {
        print("\(i) - \(name)")
}

