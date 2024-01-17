//
//  listCell.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 17/01/2024.
//

import SwiftUI

struct listCell: View {
    let sender:any View
    let text:String
    let color:Color
    let screensizeW = UIScreen.main.bounds.size.width
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(Color.customDarkBlue,lineWidth: 5)
                .background(RoundedRectangle(cornerRadius: 15).fill(color))
                
                
                
            HStack{
                Text(text)
                    .padding(20)
                    .foregroundStyle(Color.white)
                Spacer()
                if sender is employeesTabView {
                    Button{
                        
                    }label: {
                        Image(systemName: "cart.badge.plus")
                            .resizable()
                            .frame(width:30, height: 25)
                            .symbolRenderingMode(.monochrome)
                            .foregroundStyle(Color.white)
                            .padding(20)
                }
                }
                
                
            }
            .frame(height: 25)
            
        }.frame(width: screensizeW*0.9,height: 60)
            
        
        
        
    }
}

#Preview {
    listCell(sender: employeesTabView(),text: "dummy",color: Color.customLightBlue)
}
