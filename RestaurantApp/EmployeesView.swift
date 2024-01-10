//
//  EmployeesView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 10/01/2024.
//

import SwiftUI
import CoreData 
struct EmployeesView: View {
    @EnvironmentObject var viewModel:startMenuModel
    
    let screensize=UIScreen.main.bounds.size.width
    var body: some View {
        ZStack{
            Color.customLightBlue
                .ignoresSafeArea()
            VStack{
                HStack{
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .resizable()
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(.white)
                            .frame(width: 30,height: 30)
                            .padding(.leading)
                    }.opacity(viewModel.currentState == .employees ? 1:0)
                        //.animation(.default, value: viewModel.currentState)
                    Spacer()
                    Text("LOGIN")
                        .modifier(TitleText())
                        
                    Spacer()
                    Button(action: {
                        viewModel.returnToMenu()
                    }, label: {
                        Image(systemName: "house")
                            .resizable()
                            .symbolRenderingMode(.monochrome)
                            .foregroundStyle(.white)
                            .frame(width: 30,height: 25)
                            .padding(.trailing)
                    }).opacity(viewModel.currentState == .employees ? 1:0)
                        //.animation(.default, value: viewModel.currentState)
                        
                    
                
                }
                Spacer()
            }
        }
        .frame(width: viewModel.currentState == .employees ? screensize: screensize/2)
        .onTapGesture {
            withAnimation(.smooth, {
                viewModel.switchStates(self)
            })
            
        }
        .animation(.default,value: viewModel.currentState)
        
    }
}

#Preview {
    EmployeesView()
        .environmentObject(startMenuModel())
}
