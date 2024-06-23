//
//  ProfileViewModel.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 23/06/2024.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published private(set) var user: AppUser? = nil
    
    let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func fetchCurrentUser() throws {
        self.user = try authManager.fetchAuthUser()
    }
}
