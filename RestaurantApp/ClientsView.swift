//
//  ClientsView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 10/01/2024.
//

import SwiftUI


struct ClientsView: View {
    
    @EnvironmentObject var topViewModel:startMenuModel
    
    @StateObject var viewModel = ClientsViewModel()
    
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
                            viewModel.hideList()
                        },completion:{
                            withAnimation(.default, {
                                topViewModel.returnToMenu()
                            })
                        })
                        
                        
                    }, label: {
                        Image(systemName: "house")
                            .resizable()
                            .symbolRenderingMode(.monochrome)
                            .foregroundStyle(.white)
                            .frame(width: 30,height: 25)
                            .padding(.leading)
                            
                            
                            
                            
                    }).opacity(topViewModel.currentState == .clients ? 1:0)
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
                    }.opacity(topViewModel.currentState == .clients ? 1:0)
                       // .animation(.default, value: viewModel.currentState)
                    
                    
                    
                
                }
                
                GeometryReader{geo in
                    if viewModel.isListVisible{
                       // listView(sender: self).transition(.offset(y:screensizeH))
                           // .frame(height: geo.size.height+20)
                    }
                }
                Spacer()
                
                
                
                
                
            }
        }
        .frame(width:topViewModel.currentState == .clients ? screensize:screensize/2 )
        
        .onTapGesture {
            withAnimation(.default, {
                topViewModel.switchStates(self)
            },completion:{
                withAnimation(.default, {
                    viewModel.showList()
                })
            }
            )
            
        }
        
    }
        
}

#Preview {
    ClientsView().environmentObject(startMenuModel())
}



