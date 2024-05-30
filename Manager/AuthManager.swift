//
//  AuthManager.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 30/05/2024.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    
    let auth = Auth.auth()
    
    private init() { }
    
    func getAuthenticatedUser() throws -> AppUser {
        guard let user = auth.currentUser else {
            throw URLError(.badServerResponse)
        }
        return AppUser(user: user)
    }
    
    func createUser(email: String, password: String) async throws -> AppUser {
        let appUser = try await auth.createUser(withEmail: email, password: password)
        return AppUser(user: appUser.user)
    }
    
    func signOut() throws {
        try auth.signOut()
    }
}
