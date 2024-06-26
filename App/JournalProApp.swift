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
    @StateObject var serviceVM = ServiceViewModel()
    @StateObject var appointmentVM = AppointmentViewModel()
    @StateObject var calenderVM = CalenderViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView(authManager: AuthManager(), userManager: UserManager())
                    .environmentObject(serviceVM)
                    .environmentObject(appointmentVM)
                    .environmentObject(calenderVM)
            }
        }
    }
}
