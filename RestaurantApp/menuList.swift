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
    
   // @EnvironmentObject var model:EmployeesViewModel
    @StateObject var model = EmployeesMenuViewModel()
    
    let category: menuItemCategory
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.customLightBlue.ignoresSafeArea()
                VStack {
                    List{
                        ForEach(model.menuItems,id:\.id){menuItem in
                            EmployeesMenuCell(menuItem: menuItem)
                                .frame(height: 50)
                                .environmentObject(model)
                        }
                        .onDelete(perform: model.deleteMenuItem)
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.customDarkBlue,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.customLightBlue))
                                .padding(3)
                                
                            
                        )
                        
                        .listRowSeparator(.hidden)
                        
                   
                    }.scrollContentBackground(.hidden)
                        .padding(.top,0.3)
                    
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
            
        }.navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $model.detailsSheetVisible, content: {
            ZStack{
                Color.customLightBlue
                    .ignoresSafeArea()
                VStack{
                    Text(model.currentMenuItem?.name ?? "Error")
                        .modifier(menuItemName())
                    HStack{
                        Text("Price: \(model.currentMenuItem?.price ?? 0,specifier: "%.0f") $ ")
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
                    .ignoresSafeArea()
                VStack{
                    TextField("New Name", text: $model.newMenuItemName)
                        .frame(width: 250, alignment: .center)
                        .modifier(menuItemName())
                        
                    HStack{
                        TextField("Price", value: $model.newMenuItemPrice, format: .number)
                        Spacer()
                        Picker("Category: ", selection: $model.newMenuCategoru){
                            ForEach(menuItemCategory.allCases,id:\.self ){category in
                                switch category{
                                case .appetizers:
                                    Text("Appetizers")
                                case .mainCourse:
                                    Text("Main Course")
                                case .drinks:
                                    Text("Drinks")
                                case .soups:
                                    Text("Soups")
                                }
                            }
                        }
                        
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
                    
                    Button{
                        model.saveMenuItem()
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.green)
                            Text("Add menu item")
                        }
                    }
                    .frame(width: 150,height:60)
                    
                    Spacer()
                }.padding(.top,40)
            }
            .presentationContentInteraction(.scrolls)
            .presentationDetents([.medium,.large])
           // .presentationBackgroundInteraction(.enabled(upThrough: .medium))
        })
        .onAppear{
            model.currentCategory = category
            model.newMenuCategoru = category
            model.fetchMenuItems()
            model.fetchIngredients()
        }
    }
}

#Preview {
    menuList(category: .mainCourse)//.environmentObject(EmployeesViewModel())
}
