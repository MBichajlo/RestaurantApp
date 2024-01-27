//
//  employeesViewModel.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 11/01/2024.
//

enum employeesViewState{
    case login
    case logged
    case edit
    case order 
    case none
}

protocol menuListProtocol:ObservableObject  {
    
}



import SwiftUI
import CoreData

class EmployeesViewModel:menuListProtocol{
    
    private let context=PersistenceController.shared.container.viewContext
    
    // MARK: - Login Variables
    @Published  var username=""
    @Published  var password=""
    @Published  var state:employeesViewState = .none    
    @Published  var didLogIn = false
    private let correctUsername = "admin"
    private let correctPassword = "admin"

   
    //MARK: - Ingredients Variables
    @Published var newIngredientAlertShowing = false
    @Published var ingredientAlreadyExists = false
    @Published var orderAlert = false
    @Published var newIngredientName = ""
    var ingredients:[Ingredient] = []
    @Published var filteredIngredients:[Ingredient]=[]
    @Published var orderSize:Int32 = 0
    @Published var currentIngredient:Ingredient?
    @Published  var searchQuery = ""
    @Published var searching = false
    
    //MARK: - Menu Items Variables
    @Published var detailsSheetVisible = false
    @Published var currentMenuItem:MenuItem?
    @Published var currentMenuItemIngredients:[Ingredient]?
    //new menu item
    @Published var newMenuItemName = ""
    @Published var newMenuItemPrice:Double = 0
    @Published var newMenuItemIngredients:[Ingredient]=[]
    @Published var newMenuCategoru:menuItemCategory = .appetizers
    @Published var newMenuItemSheet = false
    @Published var currentCategory:menuItemCategory = .mainCourse
    @Published var menuItems:[MenuItem]=[]
    
    
    //MARK: - Login Functions
    func login() -> Bool{
        if password==correctPassword && username == correctUsername{
            state = .logged
            didLogIn = true 
            return true
        }
        return false
    }
    
    //MARK: - Menu Items Functions
    
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
    
    
    
    //MARK: - Igredients Functions
    func fetchIngredients(){
        let request = NSFetchRequest<Ingredient>(entityName: "Ingredient")
        do{
            try ingredients = context.fetch(request)
            filteredIngredients = ingredients
        }catch{
            print("fetch eroor")
        }
    }
    
    
    func filter(){
        if searchQuery.isEmpty{
            filteredIngredients = ingredients
            return
        }else{
            filteredIngredients = ingredients.filter({$0.name!.contains(searchQuery)})
            return
        }
    }
    
    func deleteIngredient(_ offsets:IndexSet){
        for index in offsets{
            let ingr = filteredIngredients[index]
            context.delete(ingr)
        }
        
        save()
        fetchIngredients()
    }
    
    func newIngredientSave(){
        
        if ingredients.contains(where: {$0.name == newIngredientName}){
            ingredientAlreadyExists = true
            return 
        }
        let newIngredient = Ingredient(context: context)
        newIngredient.id = UUID()
        newIngredient.name = newIngredientName
        newIngredient.stock = 0
        save()
        newIngredientName=""
        fetchIngredients()
    }
    
    func orderIngredients(){
        if orderSize>0{
            currentIngredient?.stock += orderSize
        }
        orderSize = 0
        currentIngredient=nil
    }
    
    
    func save(){
        do{
            try self.context.save()
        }catch{
            print("save error")
        }
    }
    
    
    
    
}
