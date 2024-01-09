//
//  RestaurantAppApp.swift
//  RestaurantApp
//
//  Created by Maciej Bichajło on 09/01/2024.
//

import SwiftUI

@main
struct RestaurantAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
