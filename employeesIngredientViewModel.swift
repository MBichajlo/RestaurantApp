//
//  employeesIngredientViewModel.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 27/01/2024.
//

import SwiftUI
import CoreData

class employeesIngredientViewModel:ObservableObject{
    private let context = PersistenceController.shared.container.viewContext
    
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
