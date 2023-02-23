//
//  Sandwich.swift
//  OrderApp
//
//  Created by yimkeul on 2023/02/23.
//

import SwiftUI

struct Sandwich : Hashable{
    let name : String
    let imageName : String
    let price : String
    let cookedTime : String
    let menuColor : Color
}

extension Sandwich {
    static let sampleData : [Sandwich] = [
        Sandwich(name: "Salad Sandwich", imageName: "saladsandwich", price: "4000", cookedTime: "10", menuColor: .mint),
        Sandwich(name: "Egg Sandwich", imageName: "eggsandwich", price: "6000", cookedTime: "5", menuColor: .pink),
        Sandwich(name: "Mozza Sandwich", imageName: "mozzasandwich", price: "7000", cookedTime: "8", menuColor: .yellow)
    ]
    
    static let singleSampleData = Sandwich(name: "Salad Sandwich", imageName: "saladsandwich", price: "4000", cookedTime: "10", menuColor: .mint)
}
