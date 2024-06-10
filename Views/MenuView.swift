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
                MenuHeaderView(title: "More")
                List {
                    Section("Profile details") {
                        ProfileMenuRow(image: "person.fill", title: "Name")
                        ProfileMenuRow(image: "envelope.fill", title: "Email")
                    }
                    Section("Business") {
                        ProfileMenuRow(image: "person.2.fill", title: "Clients")
                        ProfileMenuRow(image: "handbag.fill", title: "Services")
                        ProfileMenuRow(image: "personalhotspot", title: "Business page")
                    }
                    Section("Settings"){
                        ProfileMenuRow(image: "moon.fill", title: "Appearance")
                        ProfileMenuRow(image: "iphone", title: "Subscription")
                        ProfileMenuRow(image: "bell.badge.fill", title: "Notification")
                        ProfileMenuRow(image: "message.fill", title: "Contact us")
                        ProfileMenuRow(image: "shield.righthalf.filled", title: "Privacy policy")
                    }
                    Section("Account") {
                        ProfileMenuRow(image: "lock.fill", title: "Sign out")
                        ProfileMenuRow(image: "minus.circle.fill", title: "Delete account")
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
    let title: String
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .semibold))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.indigo)
    }
}