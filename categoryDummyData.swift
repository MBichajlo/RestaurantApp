//
//  categoryDummyData.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 20/01/2024.
//

import Foundation

public class CategoryDummy{
    var name:String
    var id:UUID
    
    init(name: String, id: UUID) {
        self.name = name
        self.id = id
    }
    
}

public let categoriesDummyData:[CategoryDummy] = [
    CategoryDummy(name: "Main Dishes", id: UUID()),
    CategoryDummy(name: "Soups", id: UUID()),
    CategoryDummy(name: "Drinks",id: UUID()),
    CategoryDummy(name: "Appetizers", id: UUID())
]
    

