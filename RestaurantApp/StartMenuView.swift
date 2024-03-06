//
//  StartMenuView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 09/01/2024.
//

import SwiftUI
import CoreData

struct StartMenuView: View {
    
    @StateObject var viewModel = startMenuModel()
    
    
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
                    .modifier(appName())
                    .transition(.push(from: .bottom))
            }
        }
    }
}

#Preview {
    StartMenuView().environment(\.managedObjectContext,PersistenceController.preview.container.viewContext)
        
}

