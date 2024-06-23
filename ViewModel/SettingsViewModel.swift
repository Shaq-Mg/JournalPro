//
//  SettingsViewModel.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 30/05/2024.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func signOut() throws {
        try authManager.signOut()
    }
    
    func deleteAccount() async throws {
        try await authManager.delete()
    }
}
