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
        NavigationView {
            ZStack{
                Color.customBeige
                    .ignoresSafeArea()
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
                        Menu{
                            Button("Ascending"){viewModel.filteredMenuItems.sort(by: {$0.name ?? "" < $1.name ?? ""})}
                            Button("Descending"){viewModel.filteredMenuItems.sort(by: {$0.name ?? "" > $1.name ?? ""})}
                            Button("Most orders"){viewModel.filteredMenuItems.sort(by: {$0.orders > $1.orders })}
                            Button("Least orders"){viewModel.filteredMenuItems.sort(by: {$0.orders < $1.orders })}
                        }label: {
                            Image(systemName: "arrow.up.arrow.down")
                                .resizable()
                                .symbolRenderingMode(.monochrome)
                                .foregroundColor(.white)
                                .frame(width: 30,height: 30)
                                .padding(.trailing)
                        }
                       /* Button {
                            
                        } label: {
                            Image(systemName: "ellipsis.circle")
                                .resizable()
                                .symbolRenderingMode(.monochrome)
                                .foregroundColor(.white)
                                .frame(width: 30,height: 30)
                                .padding(.trailing)
                        }*/.opacity(topViewModel.currentState == .clients ? 1:0)
                           // .animation(.default, value: viewModel.currentState)
                        
                        
                        
                    
                    }
                    
                    if viewModel.isListVisible{
                        ClientsMenuList()
                            .environmentObject(viewModel)
                            
                    }
                        
                    
                    Spacer()
                    
                    
                    
                    
                    
                }
            }
            .alert("Core Data Error", isPresented: $viewModel.errorAlert, actions: {
                Button("OK"){}
            })
            .frame(width:topViewModel.currentState == .clients ? screensize:screensize/2 )
        }
        
        
    }
        
}

#Preview {
    ClientsView().environmentObject(startMenuModel())
}



