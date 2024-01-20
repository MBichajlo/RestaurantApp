//
//  ingredientsCell.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 19/01/2024.
//

import SwiftUI

struct ingredientsCell: View {
    let screensizeW = UIScreen.main.bounds.size.width
    
    var body: some View {
        ZStack {
            
                
                
                
            HStack{
                Text("Dummy text")
                    .padding(20)
                    .foregroundStyle(Color.white)
                Spacer()
                
                Button{
                    print("a")
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
        
        .listRowSpacing(5)
        
        
    }
}

#Preview {
    ingredientsCell()
}
