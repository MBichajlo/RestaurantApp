//
//  loginScreen.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 12/01/2024.
//

import SwiftUI

struct loginScreen: View {
    @EnvironmentObject var model:EmployeesViewModel
    @EnvironmentObject var topViewModel:startMenuModel
    
    var body: some View {
        VStack{
            TextField("Username", text: $model.username)
                .padding(10)
                .background(Color.white.opacity(0.3))
                .cornerRadius(13)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                
            SecureField("Password", text: $model.password)
                .textContentType(.password)
                .padding(10)
                .background(Color.white.opacity(0.3))
                .cornerRadius(13)
                .autocorrectionDisabled(true)
            
            Button{
                do{
                    if try model.login(){
                        topViewModel.login()
                    }
                }catch loginErrors.wrongPassword,loginErrors.wrongUsername{
                    model.incorrect=true
                }catch loginErrors.emptyFields{
                    model.empty = true
                }catch{
                    model.generic = true
                }
                
            }label:{
                Text("Log in")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(Color.customDarkBlue)
                    .clipShape(.rect(cornerRadius: 13))
                    

            }.padding(.top,10)
                
            
                        
        }.frame(width:300,alignment: .center)
            .alert("Wrong password or username", isPresented: $model.incorrect, actions: {
                Button("Ok", role: .destructive, action: {})
            })
            .alert("Empty Field", isPresented: $model.empty, actions: {
                Button("Ok", role: .destructive, action: {})
            })
    
    }
}

#Preview {
    loginScreen().environmentObject(EmployeesViewModel())
}
