//
//  Ingredient+CoreDataProperties.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 09/01/2024.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var menu_item: NSSet?
    @NSManaged public var stock: Int32

}

// MARK: Generated accessors for menu_item
extension Ingredient {

    @objc(addMenu_itemObject:)
    @NSManaged public func addToMenu_item(_ value: MenuItem)

    @objc(removeMenu_itemObject:)
    @NSManaged public func removeFromMenu_item(_ value: MenuItem)

    @objc(addMenu_item:)
    @NSManaged public func addToMenu_item(_ values: NSSet)

    @objc(removeMenu_item:)
    @NSManaged public func removeFromMenu_item(_ values: NSSet)

}

extension Ingredient : Identifiable {

}
