//
//  MovieAppUIApp.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 18.02.2022.
//

import SwiftUI

@main
struct MovieAppUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
