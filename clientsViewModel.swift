//
//  clientsViewModel.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 11/01/2024.
//

import SwiftUI
import CoreData

@MainActor class ClientsViewModel:ObservableObject{
    @Published var isListVisible=false
    
    private let context=PersistenceController.shared.container.viewContext
    
    var menuItems:[MenuItem]=[]
    @Published var filteredMenuItems:[MenuItem]=[]
    @Published var detailsSheetVisible = false
    @Published var currentMenuItem:MenuItem?
    @Published var searchQuery = ""
    @Published var errorAlert = false
    
    func showList(){
        isListVisible=true
    }
    
    func hideList(){
        isListVisible=false
    }
    func filter(){
        if searchQuery.isEmpty{
            filteredMenuItems = menuItems
            return
        }else{
            filteredMenuItems = menuItems.filter({$0.name!.contains(searchQuery)})
            return
        }
    }
    
    
    func orderMenuItem(){
        currentMenuItem?.orders += 1
        save()
        fetchMenuItems()
        
        
    }
    
    func fetchMenuItems(){
        //let request = NSFetchRequest<MenuItem>(entityName: "MenuItem")
        do{
            try menuItems=context.fetch(MenuItem.fetchRequest())
            filteredMenuItems = menuItems
        }catch {
            errorAlert =  true
        }
    }
    
    func save(){
        do{
            try context.save()
        }catch{
            errorAlert =  true
        }
    }
}
