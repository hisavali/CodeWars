//: [Previous](@previous)

import Foundation

import XCTest

//https://www.codewars.com/kata/541c8630095125aba6000c00


func digitalRoot(of number: Int) -> Int {
    
    if ( number < 10) {
        return number 
    }
    
    let array = String(number).map { Int(String($0))! } // Convert Int -> String -> Array<Int>
    let sum = array.reduce(0, {$0 + $1})
    return digitalRoot(of: sum)
}

let i = 1234
let j = String(i).map { Int(String($0))! }

var sum = 0
for i in 0..<j.count {
    sum += j[i]
}

let sumString = String(sum).map { Int(String($0))! }
type(of :sumString)
let final = sumString.reduce(0, { $0 + $1 } )

final


class DTestCase : XCTestCase {
    func testSum () {
        XCTAssertEqual(digitalSum(of: 1234), 1 , "Failed")
        XCTAssertEqual(digitalSum(of: 16), 7, "Failed")
        XCTAssertEqual(digitalSum(of: 493193), 2, "Failed")
    } 
}

DTestCase.defaultTestSuite.run()
