//
//  JournalProApp.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import SwiftUI

@main
struct JournalProApp: App {
    let clientController = ClientController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, clientController.container.viewContext)
        }
    }
}
