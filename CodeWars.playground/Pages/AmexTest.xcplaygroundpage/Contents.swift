//: [Previous](@previous)

import Foundation

//
//Program. Write a code for following.
//for string=1462 calculate from right most to left in this manner 2+(6*2)+4+(1*2) [where every II, Iv, vi, .. should be multiplied by 2 and the sum should be divided by10 if quotient is 0 then print true otherwise false
//1462=2+(6*2)+4+(1*2) = 20%10=0 (true)
//1764526=6+(2*2)+5+(4*2)+6+(7*2)+1=44%10!=0(false)  


func dividable (_ n: Int) -> Bool {
    
    let originalNumbers = String(n).map { Int(String($0))! }
    
    var sum = 0
    for (index, value) in originalNumbers.reversed().enumerated() {
        //print("Index: \(index) - \(type(of: index))")
        if index % 2 == 0 {
            sum += (value * 2)
        } else {
            sum += value
        }
    }
    
    return sum % 10 == 0 ? true : false
}


//dividable(123)
dividable(1462)
//dividable(67891)

