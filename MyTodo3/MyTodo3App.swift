//
//  MyTodo3App.swift
//  MyTodo3
//
//  Created by user on 2023/06/13.
//

import SwiftUI
import CoreData

@main
struct MyTodo3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
