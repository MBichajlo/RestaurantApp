//
//  ClientsView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 10/01/2024.
//

import SwiftUI
import CoreData

struct ClientsView: View {
    
    @EnvironmentObject var viewModel:startMenuModel
    
    
    let screensize = UIScreen.main.bounds.size.width
    let screensizeH = UIScreen.main.bounds.size.height
    var body: some View {
        ZStack{
            Color.customBeige
                .ignoresSafeArea()
            VStack{
                HStack{
                    
                    Button(action: {
                        withAnimation(.default, {
                            viewModel.returnToMenu()
                        })
                        
                        
                    }, label: {
                        Image(systemName: "house")
                            .resizable()
                            .symbolRenderingMode(.monochrome)
                            .foregroundStyle(.white)
                            .frame(width: 30,height: 25)
                            .padding(.leading)
                            
                            
                            
                            
                    }).opacity(viewModel.currentState == .clients ? 1:0)
                        //.animation(.default, value: viewModel.currentState)
                        
                    Spacer()
                    Text("MENU")
                        .modifier(TitleText())
                        
                        
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .resizable()
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(.white)
                            .frame(width: 30,height: 30)
                            .padding(.trailing)
                    }.opacity(viewModel.currentState == .clients ? 1:0)
                       // .animation(.default, value: viewModel.currentState)
                    
                    
                    
                
                }
                
                
                
                
                
                
                Spacer()
            }
        }
        .frame(width:viewModel.currentState == .clients ? .infinity:screensize/2 )
        
        .onTapGesture {
            withAnimation(.default, {
                viewModel.switchStates(self)
            })
            viewModel.switchStates(self)
        }
        
    }
        
}

#Preview {
    ClientsView().environmentObject(startMenuModel())
}



