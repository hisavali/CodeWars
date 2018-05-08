//: [Previous](@previous)

import Foundation

/* 
 Your previous Plain Text content is preserved below:
 
 
 Design a Credit Card Parser that:
 
 1) Will validate if a credit card is valid or not
 2) Return the type of the credit card (if valid) or return nil in case the credit card isn't valid.
 
 A card is valid if the last 4 digits match the expiration date and it starts with a legitimate prefix.
 
 Card type is determined by the first 4 digits.
 2. Credit Card types:
 2.1 Acme Credit Card: Starts with 1121
 2.2 Alfa Credit Card: Starts with 1111
 2.3 Amex Credit Card: Starts with 3796
 
 For example 1111-1222-1112-1216, expiration date 12/16 is a valid credit card, because the last 4 digit matches the expiration date and it starts with the Alfa prefix.
 Sample inputs:
 1111-1222-1112-1216 expiration date: 12/16. -> Valid Alfa Credit Card
 1121-1222-1112-5432 expiration date: 12/16. -> Not valid - Last 4 don't match expiration 
 3985-1222-1112-5432 expiration date: 12/16. -> Not valid - First 4 are not a valid prefix.
 
 
 */

let cardTypes = ["1121": "Acme",
                 "1111": "Alfa",
                 "3796": "Amex"]

// enum CardTypes : String {  
//     case "1121" = "Acme"
// }

// let ct = CardTypes(rawValue: "1121")
// print (ct)

//typedef enum (CardTypes, NSUInteger) {
//    case kCardTypesAcme
//} CardTypes;
//
//enum CardTypes {
//    case Acme = "1121"
//}
//
//let ct = .Acme.rawValue

func validity(of card:String, with expiryDate:String) -> String? {
    
    // Card will never nil 
    
    let components = card.split(separator:"-")
    
    var cardType = ""
    
    for (index, component) in components.enumerated() {
        if index == 0 {
            if let ct = cardTypes[String(component)] {
                cardType = ct
            } else {
                return nil
            }
        }
        
        if index == 3 {
            if component != expiryDate {
                return nil
            }
        }
    }
    
    return cardType
}

// func validity2(of card:String, with expiryDate:String) -> String? {

//   // Card will never nil 

//   //let components = card.split(separator:"-").map { $0 }

//   var cardType = ""

//   for (index, component) in components.enumerated() {
//       if index == 0 {
//         if let ct = cardTypes[String(component)] {
//           cardType = ct
//         } else {
//           return nil
//         }
//       }

//       if index == 3 {
//         if component != expiryDate {
//           return nil
//         }
//       }
//   }

//   return cardType
// }


// Test case 1

if let output = validity(of: "1111-1222-1112-1216", with: "1216") {
    print(output == "Alfa" ? "Valid" : "Not Valid")
} else  {
    print ("Not valid")
}

let output1 = validity(of: "1121-1222-1112-5432", with: "1216") 
if (output1 != nil) {
    print("Failed - It should be not valid card")
} else  {
    print ("Not valid")
}

let output2 = validity(of: "3985-1222-1112-5432", with: "1216") 
if (output2 != nil) {
    print("Failed - It should be not valid card")
}  else  {
    print ("Not valid")
}



