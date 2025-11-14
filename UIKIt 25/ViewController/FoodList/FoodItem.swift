//
//  FoodItem.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 13/11/25.
//

import Foundation

struct FoodItem: Hashable {
    let id = UUID()
    let name: String
    
    static var fruits: [FoodItem] = [
        FoodItem(name: "Apple"),
        FoodItem(name: "Banana"),
        FoodItem(name: "Orange"),
        FoodItem(name: "Mango")
    ]
    
    static var vegetables: [FoodItem] = [
        FoodItem(name: "Carrot"),
        FoodItem(name: "Potato"),
        FoodItem(name: "Tomato"),
        FoodItem(name: "Cucumber")
    ]
}


