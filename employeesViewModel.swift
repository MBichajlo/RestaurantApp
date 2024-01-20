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

class EmployeesViewModel:ObservableObject{
    @Published  var username=""
    @Published  var password=""
    @Published  var state:employeesViewState = .none    
    @Published  var didLogIn = false
    
    @Published  var searchQuery = ""
    @Published var searching = false
    
    private let correctUsername = "admin"
    private let correctPassword = "admin"
    
    func login() -> Bool{
        if password==correctPassword && username == correctUsername{
            state = .logged
            didLogIn = true 
            return true
        }
        return false
    }
    
}
