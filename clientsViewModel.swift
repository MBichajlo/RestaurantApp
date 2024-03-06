//
//  clientsViewModel.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 11/01/2024.
//

import SwiftUI
import CoreData

enum SearchTokens:String, Hashable,CaseIterable,Identifiable{
    public var id: Self{self}
    
    case mainCourses = "Main course"
    case drinks = "Drinks"
    case appetizers = "Appetizers"
    case soups = "Soups"
    func name() -> String{
        switch self {
        case .mainCourses:
            return "Main Course"
        case .drinks:
            return"Drinks"
        case .appetizers:
           return "Appetizers"
        case .soups:
           return "Soups"
        }
    }
}



@MainActor class ClientsViewModel:ObservableObject{
    @Published var isListVisible=false
    
    private let context=PersistenceController.shared.container.viewContext
    
    var menuItems:[MenuItem]=[]
    @Published var selectedTokens = [SearchTokens]()
    @Published var suggestedTokens = SearchTokens.allCases
    
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
            
        }else{
            filteredMenuItems = menuItems.filter({$0.name!.lowercased().contains(searchQuery.lowercased())})
            
        }
        for token in selectedTokens {
            switch token {
            case .mainCourses:
                filteredMenuItems = filteredMenuItems.filter({$0.category == .mainCourse})
            case .drinks:
               filteredMenuItems = filteredMenuItems.filter({$0.category == .drinks})
            case .appetizers:
                filteredMenuItems = filteredMenuItems.filter({$0.category == .appetizers})
            case .soups:
                filteredMenuItems = filteredMenuItems.filter({$0.category == .soups})
            }
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
