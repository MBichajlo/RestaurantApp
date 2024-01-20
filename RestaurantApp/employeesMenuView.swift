//
//  employeesMenuView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 19/01/2024.
//

import SwiftUI



enum ViewCategory:String{
    case appetizers = "Appetizers"
    case mainDishes = "Main Dishes"
    case soups = "Soups"
    case drinks = "Drinks"
}



struct employeesMenuView: View {
    @EnvironmentObject var model:EmployeesViewModel
    
    let screensizeH = UIScreen.main.bounds.size.height
    let screensizeW = UIScreen.main.bounds.size.width
    
    let colorDark = Color.customDarkBlue
    let colorLight = Color.customLightBlue
    
    var body: some View {
        NavigationStack{
        ZStack{
            colorLight
                .ignoresSafeArea()
            Grid(horizontalSpacing: 20, verticalSpacing: 20){
                GridRow{
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Tile(category: "Appetizers",color: colorDark)
                    }
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Tile(category: "Main Dishes",color: colorDark)
                    }
                }
                GridRow{
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Tile(category: "Soups",color: colorDark)
                    }
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Tile(category: "Drinks",color: colorDark)
                    }
                }
            }
            
        }
        
        }   .searchable(text: $model.searchQuery,isPresented: $model.searching)
    }
}

#Preview {
    employeesMenuView()
        .environmentObject(EmployeesViewModel())
}
