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
                case .logged:
                    Text("Logged in!")
                case .edit:
                    EmptyView()
                case .order:
                    EmptyView()
                case .none:
                    EmptyView()
                }
                
                Spacer()
                
            }
        }
        .frame(width: topViewModel.currentState == .employees ? screensize: screensize/2)
        .onTapGesture {
            withAnimation(.smooth, {
                topViewModel.switchStates(self)
            },completion: {
                withAnimation(.default) {
                    viewModel.state = viewModel.didLogIn ? .logged:.login
                }
            })
            
        }
        
        
    }
}

#Preview {
    EmployeesView()
        .environmentObject(startMenuModel())
}
