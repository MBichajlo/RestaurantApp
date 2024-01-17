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
                if model.login(){
                    topViewModel.login()
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
    }
}

#Preview {
    loginScreen().environmentObject(EmployeesViewModel())
}
