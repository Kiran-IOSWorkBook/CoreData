//
//  CoreDataApp.swift
//  CoreData
//
//  Created by Kiran on 09/09/26.
//

import SwiftUI
import CoreData

@main
struct CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//            AddUserView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


