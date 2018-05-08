//: [Previous](@previous)

import Foundation
import XCTest

//https://www.codewars.com/kata/550554fd08b86f84fe000a58

func inArray(_ a1:[String], _ a2: [String]) -> [String] {
    
    let sortedA1 = Set(a1.sorted(by: <))
    
    return sortedA1.filter { s in 
        a2.contains { $0.contains(s) }
    }
}

func inArray2(_ a1: [String], _ a2: [String]) -> [String] {
    
    var result = [String]()
    
    for s1 in a1.sorted(by: <) {
        for s2 in a2 {
            if s2.contains(s1) && !result.contains(s1) {
                result.append (s1)
            }
        }
    }
    
    return result
}


class ArrayTestCase : XCTestCase {
    
    func testSolution () {
        XCTAssertEqual(inArray2(["bb","aa","bb"],["xx","xx","cc"]), [], "Failed")
        
        let a1 = ["live", "arp", "strong"] 
        let a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
        let r = ["arp", "live", "strong"]
        
        XCTAssertEqual(inArray2(a1, a2), r, "failed")
    }
}


ArrayTestCase.defaultTestSuite.run()


