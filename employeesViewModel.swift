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

enum loginErrors:Error{
    case wrongUsername
    case wrongPassword
    case emptyFields
}




import SwiftUI
import CoreData

class EmployeesViewModel:ObservableObject{
    
    private let context=PersistenceController.shared.container.viewContext
    
    // MARK: - Login Variables
    @Published  var username=""
    @Published  var password=""
    @Published  var state:employeesViewState = .none    
    @Published  var didLogIn = false
    private let correctUsername = "admin"
    private let correctPassword = "admin"
    
    @Published var incorrect = false
    @Published var empty = false
    @Published var generic = false

   
    
    
    
    
    
    //MARK: - Login Functions
    func login() throws -> Bool{
        if password.isEmpty || username.isEmpty{
            throw loginErrors.emptyFields
        }
        if password==correctPassword && username == correctUsername{
            state = .logged
            didLogIn = true 
            return true
        }else if password==correctPassword{
            throw loginErrors.wrongUsername
        }else if username == correctUsername{
            throw loginErrors.wrongPassword
        }
        return false
    }
    
   
   
    
    
    
    
}
