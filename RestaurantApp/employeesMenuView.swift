//
//  employeesMenuView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 19/01/2024.
//

import SwiftUI

struct employeesMenuView: View {
    @EnvironmentObject var model:EmployeesViewModel
    
    let screensizeH = UIScreen.main.bounds.size.height
    let screensizeW = UIScreen.main.bounds.size.width
    
    var body: some View {
        ZStack{
            
            ScrollView{
                VStack(spacing:3) {
                    ForEach(1..<50){_ in
                        menuCell()
                        
                    }
                    Button{
                        
                    }label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.green)
                            HStack{
                                Image(systemName: "plus")
                                    .resizable()
                                    .symbolRenderingMode(.monochrome)
                                    .foregroundStyle(Color.white)
                                    .frame(width: 30,height: 30)
                                    
                                
                            }
                            
                        }.frame(width: screensizeW*0.9,height: 60)
                }
                }
                .frame(width: screensizeW)
                .padding(.top,10)
            }
            
            .scrollContentBackground(.hidden)
                
                
                
             
            
            
            //Color.customBeige
            /*List{
                
                
                
                
            }.scrollContentBackground(.hidden)*/
        }
    }
}

#Preview {
    employeesMenuView()
        .environmentObject(EmployeesViewModel())
}
