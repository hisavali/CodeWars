//: [Previous](@previous)

import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
        if a == 0 {
            return b
        } 
    
        if b == 0 {
            return a
        }
    
    return gcd (b, a % b) // GCD(A,B) = GCD(B,R) where A = B⋅Q + R
}


//gcd (270, 192)
gcd(6,9)
