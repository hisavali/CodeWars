//: [Previous](@previous)

import Foundation

class List {
    var value: Int
    var next: List?
    
    init(_ value: Int, next: List?) {
        self.value = value
        self.next = next
    }
}

let l0 = List(10,next: nil)
let l1 = List(20,next: l0)
let l2 = List(30,next: l1)
let l3 = List(40,next: l2)
let l4 = List(50,next: l3)
var root = List(60,next: l4)

//print(list: root)

func print(list root: List) {
    var node: List? = root
    while (node != nil) {
        print("\(node!.value)" + "\(print(Unmanaged.passUnretained(node!).toOpaque()))")
        node = node!.next
    }
}

func insert(data value:Int, into head: inout List, at position: Int) {
    
    var index: Int = 0
    var sp: List? = head 
    var previous: List? = nil
    
    let newNode = List(value, next: nil)    
    if position == 1 {
        newNode.next = sp
        head = newNode
    } else {
        while (sp != nil && index < position) { // iterate until postion is found or end of list
            index += 1
            previous = sp
            sp = sp!.next
        }
        
        if (sp == nil) {
            previous!.next = newNode
        } else {
            newNode.next = previous!.next
            previous!.next = newNode
        }
    }
}
insert(data: 70, into: &root, at: 1)
insert(data: 5, into: &root, at: 7)
insert(data: 45, into: &root, at: 3)
//print(list: root)
print("==================")

func deleteNode(from head: inout List, at position:Int) {
    var sp: List? = head
    var previous: List? = sp
    
    if position == 1 {
        if head.next != nil {
            var node:List? = head
            head = head.next! // head.next can be nil
            node = nil // free the memory
        } else {
            print("There is only a single node in list")
        }
    } else {
        var index = 0
        while (sp != nil && index < position) {
            previous = sp
            sp = sp!.next
            index += 1
        }
        
        if (sp == nil) {
            print("position doesn't exist")
        } else {
            previous!.next = sp!.next
            sp = nil // free memory
        }
    }
    
    
}

deleteNode(from: &root, at: 1)
deleteNode(from: &root, at: 4)
deleteNode(from: &root, at: 6)
//print(list: root)


func countCircularList(_ root:List) {
    var count = 0
    var temp = root
    
    let rootMemoryAddress = Unmanaged.passUnretained(root).toOpaque()
    var tempMemoryAddress = Unmanaged.passUnretained(temp).toOpaque()
    
    repeat {
        //print("Value: \(temp.value)")
        temp = temp.next!
        count += 1
        tempMemoryAddress = Unmanaged.passUnretained(temp).toOpaque()
    } while tempMemoryAddress != rootMemoryAddress
    
    //print("Count : \(count)")
}

let c1 = List(10, next: nil)
let c2 = List(5,  next: c1)
var cRoot = List(2,  next: c2)
c1.next = cRoot
countCircularList(cRoot)



//================================================================================
// Find nth node from the end of the list
let x6 = List(25, next: nil)
let x5 = List(20, next: x6)
let x4 = List(15, next: x5)
let x3 = List(10, next: x4)
let x2 = List(5,  next: x3)
var xroot = List(2,  next: x2)

//print(list: xroot)


func find(nth n:Int,fromEndOf root:List) -> Int {
    
    var temp: List? = root
    var nthTemp = root
    var count = 0
    
    repeat {
        count += 1
        if (n < count) {
            nthTemp = nthTemp.next!
        }
        temp = temp?.next
        
    } while temp != nil

//    if (count >= n) {
//        return nthTemp.value
//    }
    
    let rootAddress = Unmanaged.passUnretained(root).toOpaque()
    let nthAddress = Unmanaged.passUnretained(nthTemp).toOpaque()
    return (nthAddress != rootAddress) ? nthTemp.value : -1 // It works for all nth element accept root
}


find(nth: 6, fromEndOf: xroot)

