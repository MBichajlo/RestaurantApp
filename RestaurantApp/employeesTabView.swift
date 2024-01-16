//
//  employeesTabView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 16/01/2024.
//

import SwiftUI

enum tab {
    case menu
    case ingredients
}

struct employeesTabView: View {
    
    @State var tab:tab = .menu
    
    var body: some View {
        ZStack{
            
            TabView{
                Group{
                    listView()
                        
                        .tabItem {
                            Text("Menu")
                            Image(systemName: "menucard")
                            
                        }
                        
                        .tag(1)
                        
                    listView()
                        .tabItem {
                            Text("Ingredients")
                            Image(systemName: "carrot")
                        }
                        .tag(2)
                }.background(Color.customLightBlue)
                    .toolbarBackground(Color.customDarkBlue, for: .tabBar)
                    
                    
            }
        }
    }
}

#Preview {
    employeesTabView()
}
