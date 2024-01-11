//
//  Category+CoreDataProperties.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 09/01/2024.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var menu_item: NSSet?

}

// MARK: Generated accessors for menu_item
extension Category {

    @objc(addMenu_itemObject:)
    @NSManaged public func addToMenu_item(_ value: MenuItem)

    @objc(removeMenu_itemObject:)
    @NSManaged public func removeFromMenu_item(_ value: MenuItem)

    @objc(addMenu_item:)
    @NSManaged public func addToMenu_item(_ values: NSSet)

    @objc(removeMenu_item:)
    @NSManaged public func removeFromMenu_item(_ values: NSSet)

}

extension Category : Identifiable {

}
