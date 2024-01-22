//
//  menuItemsDummyData.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 20/01/2024.
//

import SwiftUI

class MenuItemDummy:Identifiable{
    var price:Double
    var id:UUID
    var orders: Int32
    var ingredients:[IngredientDummy]
    var category:CategoryDummy
    init(price: Double, id: UUID, orders: Int32, ingredients: [IngredientDummy], category: CategoryDummy) {
        self.price = price
        self.id = id
        self.orders = orders
        self.ingredients = ingredients
        self.category = category
    }
    
    
}



