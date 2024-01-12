//
//  listView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 11/01/2024.
//

import SwiftUI



struct listView: View {
    @EnvironmentObject var viewModel:ClientsViewModel
    
    let screensizeH = UIScreen.main.bounds.size.height
    var body: some View {
        ZStack{
            //Color.customBeige
            List{
                ForEach(1..<100){_ in
                    Text("Dummy")
                }
                
                
                
            }.scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    listView()
        .environmentObject(ClientsViewModel())
}
