//: [Previous](@previous)

import Foundation

//Given an array of integers, every element appears twice except for one. Find that single one.
//
//Note: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?


func single(_ n:[Int]) -> Int {

    let numbers = n.sorted(by: <)
    
    for index in stride(from: numbers.startIndex, to: numbers.endIndex, by:2) {
        let nextIndex = numbers.index(after: index)
        //print("Index: \(index)  Next: \(nextIndex)") 
        //print(numbers[index])
        
        if nextIndex < numbers.endIndex {
            if numbers[index] != numbers[nextIndex] {
                return numbers[index]
            }
        } else {
            //Last index
            return numbers[index]
        }
    }
    
    return -1
}


//[1,2,3,2,1].sorted(by: <)

single([1,2,3,4,1,2,3])


let n: Int8 = 0x03
print(String(format: "%x", -n))

let s = n ^ (1 << 2) // 2nd index
print(String(format: "%x",s))



