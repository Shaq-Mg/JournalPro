//
//  MainTabView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/06/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var showSignedInView: Bool
    
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
                .environmentObject(SignInViewModel(authManager: viewModel.authManager))
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("Menu")
                }
            AccountView(viewModel: SettingsViewModel(authManager: viewModel.authManager), showSignedInView: $showSignedInView)
                .environmentObject(SettingsViewModel(authManager: viewModel.authManager))
                .tabItem {
                    Image(systemName: "gear")
                    Text("Account")
                }
        }
        .tint(.indigo)
        .task { try? await viewModel.fetchCurrentUser() }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let authManager = AuthManager()
    static let userManager = UserManager()
    static var previews: some View {
        HomeView(viewModel: ProfileViewModel(authManager: authManager, userManager: userManager), showSignedInView: .constant(false))
    }
}
