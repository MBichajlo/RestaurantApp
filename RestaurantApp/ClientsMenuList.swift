//
//  ClientsMenuList.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 30/01/2024.
//

import SwiftUI

struct ClientsMenuList: View {
    let screensizeH = UIScreen.main.bounds.size.height
    let screensizeW = UIScreen.main.bounds.size.width
    
    @EnvironmentObject var model:ClientsViewModel
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.customBeige.ignoresSafeArea()
                VStack {
                    List{
                        ForEach(model.filteredMenuItems,id:\.id){menuItem in
                            ClientsMenuCell(menuItem: menuItem)
                                .frame(height: 50)
                                .environmentObject(model)
                        }
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.customDarkBeige,lineWidth: 3)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.customBeige))
                                .padding(3)
                                
                            
                        )
                        
                        .listRowSeparator(.hidden)
                        
                   
                    }.scrollContentBackground(.hidden)
                        .padding(.top,0.3)
                    
                    
                    .padding(.bottom,30)
                    
                    
                    
                    
                }
            }
            .searchable(text: $model.searchQuery, tokens: $model.selectedTokens, token: {token in
                Text(token.rawValue)
            })
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
            
        }
        .onChange(of: model.searchQuery){
            model.filter()
        }
        .navigationBarTitleDisplayMode(.inline)
        
        .sheet(isPresented: $model.detailsSheetVisible, content: {
            ZStack{
                Color.customBeige
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
                    Button{
                        model.orderMenuItem()
                        
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.green)
                            Text("Order!")
                        }
                    }
                    .frame(width: 150,height:60)
                }.padding(.top,40)
            }
            .presentationDetents([.medium,.large])
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
            
            
        })
        
        .onAppear{
            let coloredNavAppearence = UINavigationBarAppearance()
            coloredNavAppearence.configureWithDefaultBackground()
            coloredNavAppearence.backgroundColor = UIColor(Color.customBeige)
            UINavigationBar.appearance().standardAppearance=coloredNavAppearence
            model.fetchMenuItems()
        }
    }
}

#Preview {
    ClientsMenuList()
        .environmentObject(ClientsViewModel())
}
