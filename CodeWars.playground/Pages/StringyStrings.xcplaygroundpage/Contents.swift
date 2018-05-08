//: [Previous](@previous)

import Foundation
import XCTest

//https://www.codewars.com/kata/563b74ddd19a3ad462000054

/*
 write me a function stringy that takes a size and returns a string of alternating '1s' and '0s'.
 
 the string should start with a 1.
 
 a string with size 6 should return :'101010'.
 
 with size 4 should return : '1010'.
 
 with size 12 should return : '101010101010'.
 
 The size will always be positive and will only use whole numbers.
 */

var output = ""
func stringy(_ n:Int) {
    if ( n < 1) {
        print (output)
        return
    }
    
    output.last == "1" ? output.append("0") : output.append("1") 
    stringy(n-1)
}

stringy(3)
output = ""
stringy(6)

class StringyTestCase : XCTestCase {
    func testStringy () {
            output = ""
            stringy(3)
            XCTAssertEqual(output, "101", "Failed: It should be 101")
    }
}

StringyTestCase.defaultTestSuite.run()


func stringyFP(_ n: Int) -> String {
    return (0..<n).map {$0 % 2 == 0 ? "1" : "0" }.joined()
}


print(stringyFP(5))
