//
//  Item+CoreDataProperties.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 09/01/2024.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "MenuItem")
    }

    @NSManaged public var price: Double
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var orders: Int32
    @NSManaged public var ingredient: NSSet?
    @NSManaged public var category: Category?

}

// MARK: Generated accessors for ingredient
extension Item {

    @objc(addIngredientObject:)
    @NSManaged public func addToIngredient(_ value: Ingredient)

    @objc(removeIngredientObject:)
    @NSManaged public func removeFromIngredient(_ value: Ingredient)

    @objc(addIngredient:)
    @NSManaged public func addToIngredient(_ values: NSSet)

    @objc(removeIngredient:)
    @NSManaged public func removeFromIngredient(_ values: NSSet)

}

extension Item : Identifiable {

}
