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
            }
            .presentationDetents([.medium,.large])
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
            
        })
    }
}

#Preview {
    menuList().environmentObject(EmployeesViewModel())
}
