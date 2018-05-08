//: [Previous](@previous)

import Foundation
/*
 N light bulbs are connected by a wire. Each bulb has a switch associated with it, however due to faulty wiring, a switch also changes the state of all the bulbs to the right of current bulb. Given an initial state of all bulbs, find the minimum number of switches you have to press to turn on all the bulbs. You can press the same switch multiple times.
 
 Note : 0 represents the bulb is off and 1 represents the bulb is on.
 
 Example:
 
 Input : [0, 1, 0, 1]
 Return : 4
 
 Explanation :
 press switch 0 : [1 0 1 0]
 press switch 1 : [1 1 0 1]
 press switch 2 : [1 1 1 0]
 press switch 3 : [1 1 1 1]
 */


func bulbs(_ m: [Int]) {
    
    var switches = 0
    var n = m // Keep updating
    for index in 0..<n.count {
        if n[index] == 1 {
            continue;
        } else {
            let sufix = n[index..<n.count].map { $0 == 0 ? 1 : 0 }
            let prefix = n[0..<index]
            n = prefix + sufix
            switches += 1
            print("\(n)")
        }
    }
    
    print("swithces: \(switches)")
}

bulbs([0,1,0,1])
print("----------")
//bulbs([0,0,1,1])
//print("----------")
//bulbs([1,1,1,1])
//print("----------")
bulbs([0,0,0,0])
print("----------")
bulbs([1,1,0,0])
print("----------")


// solution provided https://codelab.interviewbit.com/problems/bulbs/
func blubs(input m:[Int]) {
    var state = 0
    var ans = 0
    
    for value  in m {
        if value == state {
            ans += 1
            state = 1 - state
        }
    }
    print ("Answer:" + "\(ans)")
}


blubs(input: [0,0])


