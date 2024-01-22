//
//  menuCell.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 19/01/2024.
//

import SwiftUI

struct menuCell: View {
    let screensizeW = UIScreen.main.bounds.size.width
    
    let menuItem:MenuItem?
    @EnvironmentObject var model:EmployeesViewModel
    @State var dropDown:Bool = false
    //let index:Int
    var body: some View {
        ZStack {
            
                
                
                
            VStack {
                HStack{
                    Text("Dummy")
                        .padding(20)
                        .foregroundStyle(Color.white)
                    Spacer()
                    Button{
                        withAnimation(.linear(duration: 0.2), {
                            model.detailsSheetVisible = true
                            model.currentMenuItem = menuItem
                            
                        })
                    }label: {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(width:25, height: 10)
                            .symbolRenderingMode(.monochrome)
                            .foregroundStyle(Color.white)
                            .padding(20)
                            .rotationEffect(dropDown ? .degrees(180): .degrees(0))
                }
                    
                    
                }.padding(.top,dropDown ? 40:0)
                
                .frame(height: 25)
                if dropDown{
                    Spacer()
                }
            }
            
        }
        .frame(width: screensizeW*0.9,height: dropDown ? 200 : 60)
        //.background(Color.red)
        .animation(.default, value: dropDown)
        
        
    }
}

#Preview {
    menuCell(menuItem: .none)
}
