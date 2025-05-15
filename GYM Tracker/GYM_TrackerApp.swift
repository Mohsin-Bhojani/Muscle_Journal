//
//  GYM_TrackerApp.swift
//  GYM Tracker
//
//  Created by Abbas on 12/05/2025.
//

import SwiftUI

@main
struct GYM_TrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
