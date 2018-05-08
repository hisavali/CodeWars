//: [Previous](@previous)

import Foundation
import XCTest

//https://www.codewars.com/kata/resistor-color-codes/train/swift

enum ColorCodes: Int {
    case none = -1
    case black
    case brown 
    case red
    case orange
    case yellow
    case green
    case blue
    case violet
    case gray
    case white
    case sliver
    case gold
    
    init(_ color:String) {
        switch color.lowercased() {
        case "black":
            self = .black
        case "brown":
            self = .brown
        case "red":
            self = .red
        case "orange":
            self = .orange
        case "yellow":
            self = .yellow
        case "green":
            self = .green
        case "blue":
            self = .blue
        case "violet":
            self = .violet
        case "gray":
            self = .gray
        case "white":
            self = .white
        case "gold":
            self = .gold
        case "silver":
            self = .sliver
        default:
            self = .none
        } 
    }
    
    var multiplier: Int {
        if (ColorCodes.black.rawValue..<ColorCodes.gray.rawValue).contains(self.rawValue) {
            return Int(pow(10, Double(self.rawValue)))
        }
        return -1
    }
}
func decodeResistorColors(_ bands:String) -> String {
    let cc = bands.split(separator: " ").map { ColorCodes(String($0)) }
    

    
    var ohms = Double((cc[0].rawValue * 10 + cc[1].rawValue) * cc[2].multiplier)
    let tolerance = (cc.count == 4) ? ( cc[3] == .gold ? 5 : 10 ) : 20
    
    if (1..<1e3).contains(ohms) {
        return "\(Int(ohms)) ohms, \(tolerance)%"
    }
        
    if (1e3..<1e6).contains(Double(ohms)) {
        let ohmsInKilo = ohms / 1e3
        return "\(ohmsInKilo)k ohms, \(tolerance)%"
    }
    
    if (1e6..<990e6).contains(Double(ohms)) {
        let ohmsInMega = ohms / 1e6
        return "\(ohmsInMega)M ohms, \(tolerance)%"
    }
    
    return ""
}

class ExampleTest: XCTestCase {
    func testColorCode() {
        //decodeResistorColors("yellow blue violet gold")
        //decodeResistorColors("yellow violet brown silver")
        //decodeResistorColors("red red orange silver")
        //decodeResistorColors("yellow violet red gold")
        decodeResistorColors("red black green gold")
    }
}

ExampleTest.defaultTestSuite.run()


