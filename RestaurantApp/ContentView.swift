//
//  ContentView.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 09/01/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    
    
    var body: some View {
        ZStack{
            Text("start")
        }
    }
}
      

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
