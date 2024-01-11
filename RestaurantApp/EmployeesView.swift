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
            VStack(){
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
                
                if viewModel.state == .login && topViewModel.currentState == .employees {
                    VStack {
                        TextField("Username", text: $viewModel.username)
                            .padding(10)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(13)
                        SecureField("Password", text: $viewModel.password)
                            .padding(10)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(13)
                            
                    }
                    
                    .frame(width: 300,alignment: .center)
                    
                    
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
                    viewModel.state = .login
                }
            })
            
        }
        
        
    }
}

#Preview {
    EmployeesView()
        .environmentObject(startMenuModel())
}
