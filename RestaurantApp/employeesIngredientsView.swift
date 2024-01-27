//
//  employeesIngredientsView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 19/01/2024.
//

import SwiftUI

struct employeesIngredientsView: View {
    let screensizeH = UIScreen.main.bounds.size.height
    let screensizeW = UIScreen.main.bounds.size.width
    
    //@EnvironmentObject var model:EmployeesViewModel
    @StateObject var model = employeesIngredientViewModel()
    var body: some View {
        
          
        NavigationStack {
            ZStack {
                Color.customLightBlue.ignoresSafeArea()
                VStack {
                    List{
                        ForEach(model.filteredIngredients,id: \.id){ingredient in
                            ingredientsCell(ingredient: ingredient).environmentObject(model)
                                //.frame(height: 50)
                                
                        }
                        .onDelete(perform:model.deleteIngredient)
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.customDarkBlue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.customLightBlue))
                                .padding(3)
                            
                        )
                        
                        .listRowSeparator(.hidden)
                        
                   
                    }.scrollContentBackground(.hidden)
                    
                    HStack{
                        Spacer()
                        Button{
                            model.newIngredientAlertShowing.toggle()
                        }label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.green)
                                    .padding(.top,5)
                                    .frame(width: screensizeW*0.9, height: 60)
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                            }
                            
                        }
                        Spacer()
                    }
                    .padding(.bottom,30)
                    
                    
                    
                    
                }
            }
        }
        .searchable(text: $model.searchQuery)
        .textInputAutocapitalization(.never)
        .onAppear(){
            let coloredNavAppearence = UINavigationBarAppearance()
            coloredNavAppearence.configureWithDefaultBackground()
            coloredNavAppearence.backgroundColor = UIColor(Color.customLightBlue)
            UINavigationBar.appearance().standardAppearance=coloredNavAppearence
            
            model.fetchIngredients()
        }
        .alert("Add ingredient", isPresented: $model.newIngredientAlertShowing){
            TextField("Ingredient name", text: $model.newIngredientName)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            Button("Cancel", role: .cancel, action: {})
            Button("OK",action: model.newIngredientSave)
        }
        .alert("Ingredient already exists", isPresented: $model.ingredientAlreadyExists){
            
        }
        .onChange(of: model.searchQuery){
            model.filter()
        }
        .alert("Order ingredients", isPresented: $model.orderAlert){
            TextField("Amount: ", value: $model.orderSize,format: .number)
                
            Button("OK",action: model.orderIngredients)
            Button("Cancel", role: .cancel, action: {})
        }
        
        
    }
}

#Preview {
    employeesIngredientsView()
            //.environmentObject(EmployeesViewModel())
}
