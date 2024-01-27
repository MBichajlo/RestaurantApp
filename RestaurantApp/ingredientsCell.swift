//
//  ingredientsCell.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 19/01/2024.
//

import SwiftUI

struct ingredientsCell: View {
    
    @EnvironmentObject var model:employeesIngredientViewModel
    let screensizeW = UIScreen.main.bounds.size.width
    
    let ingredient:Ingredient
    

    var body: some View {
        ZStack {
            
                
                
                
            HStack{
                VStack(alignment:.leading) {
                    Text(ingredient.name ?? "Error")
                        .font(.system(size: 30))
                        .foregroundStyle(Color.white)
                        .padding(.leading,10)
                    
                    Text("Current stock: \(ingredient.stock)")
                        .foregroundStyle(Color.white)
                        .font(.system(size:15))
                        .frame(alignment: .trailing)
                        .padding(.leading, 40)
                }
                Spacer()
                
                Button{
                    model.currentIngredient = ingredient
                    model.orderAlert = true
                    
                }label: {
                    Image(systemName: "cart.badge.plus")
                        .resizable()
                        .frame(width:30, height: 25)
                        .symbolRenderingMode(.monochrome)
                        .foregroundStyle(Color.white)
                        .padding(20)
                }
                .buttonStyle(.plain)
                
                
                
            }
            .frame(height: 25)
            
        }
        .frame(width: screensizeW*0.9,height: 60)
      //  .background(Color.red)
        .listRowSpacing(5)
        
        
    }
}

#Preview {
    ingredientsCell(ingredient: Ingredient(context: PersistenceController.shared.container.viewContext))
        .environmentObject(employeesIngredientViewModel())
}
