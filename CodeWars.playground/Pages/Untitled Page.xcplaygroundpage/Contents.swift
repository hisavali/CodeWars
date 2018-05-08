//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import XCTest

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


func inArray(_ a1: [String], _ a2: [String]) -> [String] {
    return a1.filter({ s in
        return a2.contains { $0.contains(s) }
    })
}

let a1 = ["arp", "mice", "live"]
let a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

//print("sharp".contains("arp"))

print(inArray(a1, a2))


func stringy2(_ size: Int) -> String {
    guard size > 1 else { return "1" }
    
    var output = "1"
    for i in 2...size {
        output.last == "1" ? output.append("0") : output.append("1")
    }
    
    return output
}


class StringfyTest : XCTestCase {
    func testExample() {
        XCTAssertEqual(stringy(1), "1")
        XCTAssertEqual(stringy(2), "10")
        XCTAssertEqual(stringy(3), "101")
        XCTAssertEqual(stringy(6), "101010")
        XCTAssertEqual(stringy(12), "101010101010")
    }
}

//StringfyTest.defaultTestSuite.run()

func stringy(_ size: Int) -> String {
    return (0..<size).map { $0 % 2 == 0 ? "1" : "0" }.joined()
}

print(stringy(12))


func map<A,B>(_ f: @escaping (A)-> B) -> ([A]) -> [B] {
    return { xs in 
        var result = [B]()
        xs.forEach { result.append(f($0))}
        return result
    }
}

//func incr<A>(_ i: A) -> A where A == Hashable {
//    return i + 1
//}

func incr(_ i: Int) -> Int { 
    return i + 1 
}


[1,2,3].map(incr)

