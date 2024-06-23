//
//  ProfileViewModel.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 23/06/2024.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published private(set) var user: DBUser? = nil
    
    let authManager: AuthManager
    let userManager: UserManager
    
    init(authManager: AuthManager, userManager: UserManager) {
        self.authManager = authManager
        self.userManager = userManager
    }
    
    func fetchCurrentUser() async throws {
       let authDataResult = try authManager.fetchAuthUser()
        self.user = try await userManager.getUser(userId: authDataResult.uid)
    }
}
