//
//  MenuView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 10/06/2024.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                MenuHeaderView(isPressed: { }, title: "Menu")
                List {
                    Section("Business") {
                        ProfileMenuRow(image: "calendar", title: "Bookings")
                        ProfileMenuRow(image: "person.2.fill", title: "Clients")
                        ProfileMenuRow(image: "handbag.fill", title: "Services")
                        ProfileMenuRow(image: "book.closed.fill", title: "Schedule")
                        ProfileMenuRow(image: "personalhotspot", title: "Business page")
                    }
                    Section("Settings"){
                        ProfileMenuRow(image: "moon.fill", title: "Appearance")
                        ProfileMenuRow(image: "iphone", title: "Subscriptions")
                        ProfileMenuRow(image: "bell.badge.fill", title: "Notifications")
                        ProfileMenuRow(image: "message.fill", title: "Contact us")
                        ProfileMenuRow(image: "shield.righthalf.filled", title: "Privacy policy")
                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MenuView()
        }
    }
}

struct MenuHeaderView: View {
    var isNavigate = false
    var isPressed: () -> ()
    let title: String
    var body: some View {
        VStack {
            if isNavigate {
                HStack {
                    Text("Cancel")
                        .foregroundStyle(.clear)
                    Spacer()
                    VStack(alignment: .leading, spacing: 6) {
                        Text(title)
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    Spacer()
                    Button {
                        isPressed()
                    } label: {
                        Text("Cancel")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            } else {
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .semibold))
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.indigo)
    }
}
