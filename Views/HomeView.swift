//
//  MainTabView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/06/2024.
//

import SwiftUI

struct HomeView: View {
    let authManager: AuthManager
    var body: some View {
        TabView {
            MainChartView()
                .environmentObject(AppointmentViewModel())
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            CalenderView()
                .environmentObject(CalenderViewModel())
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Bookings")
                }
            MenuView()
                .environmentObject(SignInViewModel(authManager: authManager))
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("Menu")
                }
            AccountView(viewModel: SettingsViewModel(authManager: authManager))
                .environmentObject(SettingsViewModel(authManager: authManager))
                .tabItem {
                    Image(systemName: "gear")
                    Text("Account")
                }
        }
        .tint(.indigo)
    }
}

struct HomeView_Previews: PreviewProvider {
    static let authManager = AuthManager()
    static var previews: some View {
        HomeView(authManager: authManager)
    }
}
