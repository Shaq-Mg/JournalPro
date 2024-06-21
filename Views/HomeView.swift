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
            ServicesView()
                .environmentObject(ServiceViewModel())
                .tabItem {
                    Image(systemName: "pencil.line")
                    Text("Service")
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
        }
        .tint(.indigo)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
