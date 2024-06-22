//
//  MainTabView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/06/2024.
//

import SwiftUI

struct HomeView: View {
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
                .environmentObject(SignInViewModel(authManager: AuthManager()))
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("Menu")
                }
            AccountView(viewModel: SettingsViewModel(authManager: AuthManager()))
                .environmentObject(SettingsViewModel(authManager: AuthManager()))
                .tabItem {
                    Image(systemName: "gear")
                    Text("Account")
                }
        }
        .tint(.indigo)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
