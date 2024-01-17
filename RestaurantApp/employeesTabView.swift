//
//  employeesTabView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 16/01/2024.
//

import SwiftUI



struct employeesTabView: View {
   
    
    
    
    
    var body: some View {
        ZStack{
            
            TabView{
                Group{
                    listView(sender:self)
                        
                        
                        .tabItem {
                            Text("Menu")
                            Image(systemName: "menucard")
                            
                        }
                        
                        .tag(1)
                        
                    listView(sender:self)
                        .tabItem {
                            Text("Ingredients")
                            Image(systemName: "carrot")
                        }
                        
                        .tag(2)
                    
                    
                        
                }
                .toolbarBackground(Color.customDarkBlue, for:.tabBar)
                .toolbar(.visible, for: .tabBar)
                .background(Color.customLightBlue)
                    
            }
        }
    }
}

#Preview {
    employeesTabView()
}
