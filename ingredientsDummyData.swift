//
//  ingredientsDummyData.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 20/01/2024.
//

import Foundation

class IngredientDummy{
    var name:String
    var id:UUID
    var stock:Int32
    init(name: String, id: UUID,stock:Int32) {
        self.name = name
        self.id = id
        self.stock = stock
    }
}

let ingredientsDummyData:[IngredientDummy]=[
    IngredientDummy(name: "Chicken", id: UUID(), stock: 60),
    IngredientDummy(name: "Spaghetti", id: UUID(), stock: 200),
    IngredientDummy(name: "Garlic", id: UUID(), stock: 70),
    IngredientDummy(name: "Onion", id: UUID(), stock: 20),
    IngredientDummy(name: "Bun", id: UUID(), stock: 50),
    IngredientDummy(name: "Beef", id: UUID(), stock: 400),
    IngredientDummy(name: "Tomato", id: UUID(), stock: 300),
    IngredientDummy(name: "Bacon", id: UUID(), stock: 200),
    IngredientDummy(name: "Lettuce", id: UUID(), stock: 300),
    IngredientDummy(name: "Chicken stock", id: UUID(), stock: 200)

]
