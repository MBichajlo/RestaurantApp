//
//  EmployeesView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 10/01/2024.
//

import SwiftUI
import CoreData 
struct EmployeesView: View {
    @EnvironmentObject var topViewModel:startMenuModel
    @StateObject var viewModel = EmployeesViewModel()
    
    
    let screensize=UIScreen.main.bounds.size.width
    var body: some View {
        
            ZStack{
                Color.customLightBlue
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.smooth, {
                            topViewModel.switchStates(self)
                        },completion: {
                            withAnimation(.smooth) {
                                viewModel.state = topViewModel.didLogin ? .logged:.login
                            }
                        })
                        
                    }
                VStack{
                    HStack{//Navigation Bar
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis.circle")
                                .resizable()
                                .symbolRenderingMode(.monochrome)
                                .foregroundColor(.white)
                                .frame(width: 30,height: 30)
                                .padding(.leading)
                        }.opacity(topViewModel.currentState == .employees ? 1:0)
                            //.animation(.default, value: viewModel.currentState)
                        Spacer()
                        Text("LOGIN")
                            .modifier(TitleText())
                            
                        Spacer()
                        Button(action: {
                            withAnimation(.default, {
                                viewModel.state = .none
                            },completion:{
                                withAnimation(.default) {
                                    topViewModel.returnToMenu()
                                }
                            })
                            
                        }, label: {
                            Image(systemName: "house")
                                .resizable()
                                .symbolRenderingMode(.monochrome)
                                .foregroundStyle(.white)
                                .frame(width: 30,height: 25)
                                .padding(.trailing)
                        }).opacity(topViewModel.currentState == .employees ? 1:0)
                            //.animation(.default, value: viewModel.currentState)
                            
                        
                    
                    }//Navigation Bar
                    
                    Spacer()
                    
                    switch viewModel.state {
                    case .login:
                        loginScreen().environmentObject(viewModel)
                        Spacer()
                    case .logged:
                        TabView{
                            Group{
                                employeesMenuView().environmentObject(viewModel)
                                    .tabItem {
                                        Text("Menu")
                                        Image(systemName: "menucard")
                                    }
                                    .tag(1)
                                    
                                employeesIngredientsView().environmentObject(viewModel)
                                    .tabItem {
                                        Text("Ingredients")
                                            
                                        Image(systemName: "carrot")
                                            
                                    }
                                    .tag(2)
                            }
                            .toolbarBackground(Color.customDarkBlue, for: .tabBar)
                            .background(Color.customLightBlue)
                            .toolbarBackground(.visible, for: .tabBar)
                            
                                
                        }
                    case .edit:
                        EmptyView()
                    case .order:
                        EmptyView()
                    case .none:
                        EmptyView()
                    }
                    
                    
                    
                }
            }
            .frame(width: topViewModel.currentState == .employees ? screensize: screensize/2)
        
        
        
        
    }
}

#Preview {
    EmployeesView()
        .environmentObject(startMenuModel())
}
