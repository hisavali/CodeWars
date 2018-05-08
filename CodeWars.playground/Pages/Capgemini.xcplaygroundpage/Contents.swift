//: [Previous](@previous)

import Foundation
import XCTest

/*
 {
 "catalog" : {
    "products":[
         {
         "name": "apple",
         "price": 0.60,
         "discount" : {
             "type": "BuyOneGetOneFree"
             "amount": 0
             }
         }, 
         {
         "name": "orange",
         "price": 0.25,
         "discount" : {
             "type": "ThreeForPriceOfTwo"
             "amount": 0
             }
         }
     ]
 }
 }
 */

public struct Catalog {
    public enum Products: String {
        case apple = "Apple"
        case orange = "Orange"
        
        public enum DiscountType: Int {
            case buyOneGetOneFree
            case threeForPriceOfTwo
        }
        
        func price() -> Double {
            switch self {
                case .apple: return 60/100
                case .orange: return 25/100 
            }
        }
        
        var discountType: DiscountType {
            switch self {
            case .apple:
                return DiscountType.buyOneGetOneFree
            case .orange:
                return DiscountType.threeForPriceOfTwo
            }
        }
    }
}

// One of the modules in Point of sale system 
struct CheckoutSystem {
    
    // API:  
    public func totalPrice(_ products:[Catalog.Products]) -> Double {
        return products.reduce(0, { $0 + $1.price() })
    }
    
    public func totalPrice21(_ products:[Catalog.Products]) -> Double {
        
        var totalApplePrice = products
                                .filter { $0 == .apple }
                                .reduce (0, { $0 + $1.price()})
        
        if (Catalog.Products.apple.discountType == .buyOneGetOneFree) {
            let apples = products.filter { $0 == .apple }.count
            let price = Catalog.Products.apple.price()
            apples / 2
            totalApplePrice -= Double(Int(apples / 2)) * price     
        }
        
        var totalOrangePrice = products
            .filter { $0 == .orange }
            .reduce (0, { $0 + $1.price()})
        
        if (Catalog.Products.orange.discountType == .threeForPriceOfTwo) {
            let oranges = products.filter { $0 == .orange }.count
            let price = Catalog.Products.orange.price()
            oranges / 3
            totalOrangePrice -= Double(Int(oranges / 3)) * price     
        }
        
        return totalApplePrice + totalOrangePrice
    }
    
    public func totalPrice2(_ products:[Catalog.Products]) -> Double {
        
        var totalPrice: Double = 0
        let catalog: [Catalog.Products] = [.orange,.apple] 
        for product in catalog  {
            var totalPriceOfProduct = products
                                        .filter({$0 == product})
                                        .reduce(0, {$0 + $1.price()})
            
            let productCount = products.filter { $0 == product }.count
            switch product.discountType {
            case .buyOneGetOneFree:
                totalPriceOfProduct -= Double(Int(productCount/2)) * product.price()
            case .threeForPriceOfTwo:
                totalPriceOfProduct -= Double(Int(productCount/3)) * product.price()
            }
            totalPrice += totalPriceOfProduct
        }
        
        return totalPrice
    }
    
    // API: to return no of items in cart
    public func numberOfItems() -> Int {
        return 0
    }
}


let total = CheckoutSystem().totalPrice([.apple,.apple, .orange, .orange])


class CheckoutSystemTests : XCTestCase {
    
    var products: [Catalog.Products] = []
    
    override func setUp() {
         super.setUp()
    }
    
    func testPriceOfEmptyCart() {
        XCTAssertEqual(CheckoutSystem().totalPrice(products), 0, "Failed: Total should be zero")
    }
    
    func testPriceOfSingleItemInCart() {
        products = [.apple]
        XCTAssertEqual(CheckoutSystem().totalPrice(products), 0.6, "Failed: Price of \(Catalog.Products.apple) should be 0.6")
        
        products = [.orange]
        XCTAssertEqual(CheckoutSystem().totalPrice(products), 0.25,"Failed: Price of \(Catalog.Products.orange) should be 0.25")
    }
    
    func testPriceOfMutlipleItemsInCart() {
        products = [.apple,.orange]
        XCTAssertEqual(CheckoutSystem().totalPrice(products), 0.85, "Failed: Price of Apple + Orange should be 0.85")
        
        products = [.apple,.apple, .orange, .orange]
        XCTAssertEqual(CheckoutSystem().totalPrice(products), 1.7, "Failed: Price of Apple + Orange should be 0.85")
    }
    
    ///
    func testDiscountedPriceOfItem() {
        XCTAssertEqual(Catalog.Products.apple.discountType, .buyOneGetOneFree, "Failed: Discounted price should be 0")
    }
    
    func testDiscountedPriceOfSingleItem() {
        products = [.apple]
        XCTAssertEqual(CheckoutSystem().totalPrice2(products), 0.6, "Failed: No discount applied and Apple price should be 0.6")
        
        
        products = [.orange]
        XCTAssertEqual(CheckoutSystem().totalPrice2(products), 0.25, "Failed: No discount applied and Apple price should be 0.6")
    }
    
    func testDiscountedPriceOfMultipleApplesInCart() {
        products = [.apple,.apple]
        XCTAssertEqual(CheckoutSystem().totalPrice2(products), 0.6, "Failed: Discount is applied and total price should be 0.6")
        
        products = [.apple,.apple,.apple]
        XCTAssertEqual(CheckoutSystem().totalPrice2(products), 1.2, accuracy: 0.0000001, "Failed: Discount applied and totla price should be 1.2")
        
        
        products = [.apple,.apple,.apple,.apple]
        XCTAssertEqual(CheckoutSystem().totalPrice2(products), 1.2, accuracy: 0.0000001, "Failed: Discount applied and totla price should be 1.2")
        
        
        products = [.orange,.orange]
        XCTAssertEqual(CheckoutSystem().totalPrice2(products), 0.5, accuracy: 0.0000001, "Failed: Discount applied and totla price should be 0.5")
        
        products = [.orange,.orange,.orange]
        XCTAssertEqual(CheckoutSystem().totalPrice2(products), 0.5, accuracy: 0.0000001, "Failed: Discount applied and totla price should be 0.5")
        
        products = [.orange,.orange,.orange,.orange]
        XCTAssertEqual(CheckoutSystem().totalPrice2(products), 0.75, accuracy: 0.0000001, "Failed: Discount applied and totla price should be 0.75")
        
        products = [.orange,.orange,.orange,.orange,.apple]
        XCTAssertEqual(CheckoutSystem().totalPrice2(products), 1.35, accuracy: 0.0000001, "Failed: Discount applied and totla price should be 1.35")
        
        products = [.orange,.orange,.orange,.orange,.apple,.apple]
        XCTAssertEqual(CheckoutSystem().totalPrice2(products), 1.35, accuracy: 0.0000001, "Failed: Discount applied and totla price should be 1.35")
        
        products = [.orange,.orange,.orange,.apple,.apple]
        XCTAssertEqual(CheckoutSystem().totalPrice2(products), 1.1, accuracy: 0.0000001, "Failed: Discount applied and totla price should be 1.1")
    }
    
}

CheckoutSystemTests.defaultTestSuite.run()
