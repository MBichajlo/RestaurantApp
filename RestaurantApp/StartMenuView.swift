//
//  StartMenuView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 09/01/2024.
//

import SwiftUI
import CoreData

struct StartMenuView: View {
    @Environment(\.managedObjectContext) private var viewContext 
    
    @Namespace private var animation
    @StateObject var viewModel = startMenuModel()
    
    let screensize = UIScreen.main.bounds.size.width
    
    
    var body: some View {
        
        ZStack {
            HStack(spacing:0){
                if viewModel.currentState != .clients{
                    EmployeesView()
                        .transition(.move(edge: .leading))
                        
                }
                
                if viewModel.currentState != .employees{
                    ClientsView()
                        .transition(.move(edge: .trailing))
                        
                }
                
                    
            }.environmentObject(viewModel)
            if viewModel.currentState == .menu {
                Text("Restaurant App")
            }
           
            
            
        }
    }
}

#Preview {
    StartMenuView().environment(\.managedObjectContext,PersistenceController.preview.container.viewContext)
        
}

