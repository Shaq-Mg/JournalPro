//
//  SignInViewModel.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 30/05/2024.
//

import Foundation
import FirebaseAuth

@MainActor
final class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var loginStatusMessage = ""
    
    let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            print("No email or password found.") // handle error
            return
        }
        try await authManager.createUser(email: email, password: password)
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Incoorect login information") // handle error
            return
        }
        try await authManager.signIn(email: email, password: password)
    }
    
    func resetPassword() async throws {
        let authUser = try authManager.fetchAuthUser()
        
        guard let email = authUser.email else {
            return // handle error
        }
        try await authManager.restPassword(email: email)
    }
    
    func updatePassword(password: String) async throws {
        try await authManager.updatePassword(password: password)
    }
    
    func updateEmail(email: String) async throws {
        try await authManager.updateEmail(email: email)
    }
}
