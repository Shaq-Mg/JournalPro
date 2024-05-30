//
//  JournalProApp.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct JournalProApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let clientController = ClientController()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ClientListView()
                    .environment(\.managedObjectContext, clientController.container.viewContext)
            }
        }
    }
}
