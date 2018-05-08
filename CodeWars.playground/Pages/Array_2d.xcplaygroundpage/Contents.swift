//: [Previous](@previous)

import Foundation


func performOps(_ A: [[Int]]) {
    
    var output: [[Int]] = []
    for i in 0..<A.endIndex { // Out loop
        let n = A[0].count // number of elements in inner array
        for j in 0..<A[0].endIndex {
            output[i][n-1-j] = A[i][j]
        }
    }
    output
}

//performOps([[]])
//performOps([[1,2,3],[4,5,6]])

