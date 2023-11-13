//
//  Pro_IPhone_Understanding_Data_PersistenceApp.swift
//  Pro IPhone Understanding Data Persistence
//
//  Created by Eddington, Nick on 11/1/23.
//

import SwiftUI

@main
struct Pro_IPhone_Understanding_Data_PersistenceApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ItemListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            // You can also include ItemListView here if you want to display it as the initial view.
        }
    }
}
