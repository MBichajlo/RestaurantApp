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

import SwiftUI
import CoreData

class EmployeesViewModel:ObservableObject{
    @Published  var username=""
    @Published  var password=""
    @Published  var state:employeesViewState = .none    
    @Published  var didLogIn = false
    
    @Published  var searchQuery = ""
    @Published var searching = false
    
    
    
    private let correctUsername = "admin"
    private let correctPassword = "admin"
    
    private let context=PersistenceController.shared.container.viewContext
    
    @Published var newIngredientAlertShowing = false 
    @Published var ingredientAlreadyExists = false
    @Published var orderAlert = false
    @Published var newIngredientName = ""
    var ingredients:[Ingredient] = []
    @Published var filteredIngredients:[Ingredient]=[]
    @Published var orderSize:Int32 = 0
    @Published var currentIngredient:Ingredient?
    
    func login() -> Bool{
        if password==correctPassword && username == correctUsername{
            state = .logged
            didLogIn = true 
            return true
        }
        return false
    }
    
    
    
    
    
    
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
            let ingr = ingredients[index]
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
    
    
    func save(){
        do{
            try self.context.save()
        }catch{
            print("save error")
        }
    }
    
    func orderIngredients(){
        if orderSize>0{
            currentIngredient?.stock += orderSize
        }
        orderSize = 0
        currentIngredient=nil
    }
    
    
}
