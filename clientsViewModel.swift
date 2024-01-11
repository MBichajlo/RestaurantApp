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
    @Published var menuItems:[MenuItem]=[]
    
    func showList(){
        isListVisible=true
    }
    
    func hideList(){
        isListVisible=false
    }
    
    func fetchData(){
        //let request = NSFetchRequest<MenuItem>(entityName: "MenuItem")
        do{
            try menuItems=context.fetch(MenuItem.fetchRequest())
        }catch{
            print ("fetch error")
        }
    }
}
