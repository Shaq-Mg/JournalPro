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
    
    init() { }
    
    func fetchAuthUser() throws -> AppUser {
        guard let user = auth.currentUser else {
            throw URLError(.badServerResponse) // handle error
        }
        return AppUser(user: user)
    }
    
    @discardableResult
    func createUser(email: String, password: String) async throws -> AppUser {
        let authDataResult = try await auth.createUser(withEmail: email, password: password)
        return AppUser(user: authDataResult.user)
    }
    
    @discardableResult
    func signIn(email: String, password: String) async throws -> AppUser {
        let authDataResult = try await auth.signIn(withEmail: email, password: password)
        return AppUser(user: authDataResult.user)
    }
    
    func signOut() throws {
        try auth.signOut()
    }
    
    func delete() async throws {
        guard let user = auth.currentUser else {
            return // handle error
        }
        try await user.delete()
    }
    
    func updatePassword(password: String) async throws {
        guard let user = auth.currentUser else {
            return // hnadle error
        }
        try await user.updatePassword(to: password)
    }
    
    func updateEmail(email: String) async throws {
//        guard let user = auth.currentUser else {
//            return // hnadle error
//        }
//        try await user.updateEmail(to: email)
    }
    
    func restPassword(email: String) async throws {
        try await auth.sendPasswordReset(withEmail: email)
    }
}
