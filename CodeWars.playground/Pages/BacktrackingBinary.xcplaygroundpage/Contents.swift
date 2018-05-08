//: [Previous](@previous)

import Foundation

// Generate all the strings of n bits

var a:String = ""
func binary(_ n: Int) {
    if (n < 1) {
        print(a)
        //return
    } else {
        a.append("0")
        binary(n-1)
        a = String(a.dropLast(1))
        a.append("1")
        binary(n-1)
        a = String(a.dropFirst(1))
    }
}

binary(3)
print(" final: " + a)
