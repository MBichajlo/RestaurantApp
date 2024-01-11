//
//  startMenuViewModel.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 10/01/2024.
//

import SwiftUI


enum  viewStates{
    case menu
    case clients
    case employees
}


@MainActor class startMenuModel:ObservableObject{
   
    
    @Published var currentState:viewStates = .menu
    
    @Published var clientViewVis:Bool=false
    @Published var employeesViewVis:Bool=false
    
    func returnToMenu(){
        currentState = .menu
    }
    
    func switchStates(_ sender:any View){
        switch sender {
        case is ClientsView:
            currentState = .clients
        case is EmployeesView:
            currentState = .employees
        default:
            currentState = .menu
        }
        
    }
    
}
