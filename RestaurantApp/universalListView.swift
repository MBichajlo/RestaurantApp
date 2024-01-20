//
//  universalListView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 20/01/2024.
//

import SwiftUI

enum useCase{
    case ingredients
    case menuClients
    case menuEmployees
}


struct universalListView: View {
    
    let use:useCase
    
    @State var x=""
    
    var body: some View {
        List{
            ForEach(1..<50){_ in
                switch use {
                case .ingredients:
                    ingredientsCell()
                        .frame(height: 40)
                case .menuClients:
                    menuCell()
                       // .frame(height: 40)
                case .menuEmployees:
                    menuCell()
                        //.frame(height: 40)
                }
                    
                    
            }.listRowBackground(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color.customDarkBlue,lineWidth: 5)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.customLightBlue))
                    .padding(2)
                    
            )
            .listRowSeparator(.hidden)
            if use != .menuClients{
                HStack{
                    Spacer()
                    Button{
                        
                    }label: {
                       
                    }
                    Spacer()
                }.listRowBackground(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.green))
            }
            
            
            
            
        }
        .searchable(text: $x)
        
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    universalListView(use: .menuEmployees)
        
}
