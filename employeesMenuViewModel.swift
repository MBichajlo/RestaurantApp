//
//  employeesMenuViewModel.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 27/01/2024.
//

import SwiftUI
import CoreData

class EmployeesMenuViewModel:ObservableObject{
    private let context = PersistenceController.shared.container.viewContext
    
    @Published var detailsSheetVisible = false
    @Published var currentMenuItem:MenuItem?
    @Published var currentMenuItemIngredients:[Ingredient]?
    var ingredients:[Ingredient] = []
    @Published var newMenuItemName = ""
    @Published var newMenuItemPrice:Double = 0
    @Published var newMenuItemIngredients:[Ingredient]=[]
    @Published var newMenuCategoru:menuItemCategory = .appetizers
    @Published var newMenuItemSheet = false
    @Published var currentCategory:menuItemCategory = .mainCourse
    @Published var menuItems:[MenuItem]=[]
    
    func changeCurrentItem(item: MenuItem){
        currentMenuItem = item
        currentMenuItemIngredients = Array(item.ingredient as? Set<Ingredient> ?? [])
    }
    
    func addAndRemoveIngredient(ingredient:Ingredient){
        if newMenuItemIngredients.contains(ingredient){
            newMenuItemIngredients.removeAll(where: {$0 == ingredient})
        }else{
            newMenuItemIngredients.append(ingredient)
        }
    }
    
    func saveMenuItem(){
        let newMenuItem = MenuItem(context: context)
        newMenuItem.name = newMenuItemName
        newMenuItem.price = newMenuItemPrice
        newMenuItem.category = newMenuCategoru
        for i in newMenuItemIngredients{
            newMenuItem.addToIngredient(i)
        }
        newMenuItem.id=UUID()
        newMenuItem.orders=0
        save()
        fetchMenuItems()
    }
    
    func deleteMenuItem(offsets: IndexSet){
        for index in offsets{
            let item=menuItems[index]
            context.delete(item)
        }
        save()
        fetchMenuItems()
        
    }
    
    func fetchMenuItems(){
        let request = NSFetchRequest<MenuItem>(entityName: "MenuItem")
        request.predicate = NSPredicate(format: "category = %i", currentCategory.rawValue)
        do{
            try menuItems = context.fetch(request)
        }catch{
            print("fetch error")
        }
    }
    
    func fetchIngredients(){
        let request = NSFetchRequest<Ingredient>(entityName: "Ingredient")
        do{
            try ingredients = context.fetch(request)
           // filteredIngredients = ingredients
        }catch{
            print("fetch eroor")
        }
    }
    
    func save(){
        do{
            try self.context.save()
        }catch{
            print("save error")
        }
    }
}
