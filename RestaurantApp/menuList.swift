//
//  menuList.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 22/01/2024.
//

import SwiftUI

struct menuList: View {
    let screensizeH = UIScreen.main.bounds.size.height
    let screensizeW = UIScreen.main.bounds.size.width
    
    @EnvironmentObject var model:EmployeesViewModel
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.customLightBlue.ignoresSafeArea()
                VStack {
                    List{
                        ForEach(1..<100){ingredient in
                            menuCell(menuItem: .none)
                                .frame(height: 50)
                            
                                
                        }
                        //.onDelete(perform:model.deleteIngredient)
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
                            model.newMenuItemSheet = true
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
        }.sheet(isPresented: $model.detailsSheetVisible, content: {
            ZStack{
                Color.customLightBlue
                VStack{
                    Text(model.currentMenuItem?.name ?? "Error")
                        .modifier(menuItemName())
                    HStack{
                        Text("Price: \(model.currentMenuItem?.price ?? 0)")
                        Spacer()
                        Text("Ordered \(model.currentMenuItem?.orders ?? 0) times ")
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    ForEach(Array(model.currentMenuItem?.ingredient as? Set<Ingredient> ?? []),id: \.id){ingr in
                        Text(ingr.name ?? "Error")
                    }
                    Spacer()
                }.padding(.top,40)
            }
            .presentationDetents([.medium,.large])
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
            
            
        })
        .sheet(isPresented: $model.newMenuItemSheet, content: {
            ZStack{
                Color.customLightBlue
                VStack{
                    TextField("New Name", text: $model.newMenuItemName)
                        .frame(width: 250, alignment: .center)
                        .modifier(menuItemName())
                        
                    HStack{
                        TextField("Price", value: $model.newMenuItemPrice, format: .number)
                        Spacer()
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    List(model.ingredients,id: \.id){ingr in
                        Button{
                            model.addAndRemoveIngredient(ingredient: ingr)
                        }label: {
                            HStack{
                                Text(ingr.name ?? "Error")
                                Spacer()
                                Image(systemName: "checkmark.circle")
                                    .symbolRenderingMode(.hierarchical)
                                    .foregroundStyle(model.newMenuItemIngredients.contains(where: {$0 == ingr}) ? Color.green : Color.white)
                            }
                                
                        }
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.customDarkBlue,lineWidth: 3)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.customLightBlue))
                            .padding(3)
                        )
                    }
                    
                    .scrollContentBackground(.hidden)
                    Spacer()
                }.padding(.top,40)
            }
            .presentationContentInteraction(.scrolls)
            .presentationDetents([.medium,.large])
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
        })
        .onAppear{
            
            model.fetchIngredients()
        }
    }
}

#Preview {
    menuList().environmentObject(EmployeesViewModel())
}
