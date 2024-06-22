//
//  SettingsView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 22/06/2024.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @Binding var showSignedInView: Bool
    @State private var showSignOutAlert = false
    
    var body: some View {
        VStack {
            MenuHeaderView(isPressed: { }, title: "Account")
            List {
                Section("Profile information") {
                    AccountButtonView(isPressed: { }, title: "Update password", imageName: "key.fill")
                    
                    AccountButtonView(isPressed: { }, title: "Update email", imageName: "envelope.fill")
                }
                
                Section("Account") {
                    AccountButtonView(isPressed: { showSignOutAlert.toggle() }, title: "Sign out", imageName: "lock.fill")
                    
                    AccountButtonView(isPressed: { }, title: "Delete account ", imageName: "minus.circle.fill")
                }
            }
        }
        .confirmationDialog("Are uou sure you want to sign out your account?", isPresented: $showSignOutAlert) {
            Button("Yes") {
                try? viewModel.signOut()
                showSignedInView = true
                
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static let authManager = AuthManager()
    static var previews: some View {
        AccountView(viewModel: SettingsViewModel(authManager: authManager), showSignedInView: .constant(false))
    }
}

struct AccountButtonView: View {
    var isPressed: () -> ()
    let title: String
    let imageName: String
    var body: some View {
        Button {
            isPressed()
        } label: {
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: imageName)
                    .foregroundStyle(.indigo)
                Text(title)
            }
            .font(.system(size: 18, weight: .semibold))
            .foregroundStyle(.black)
        }
    }
}
