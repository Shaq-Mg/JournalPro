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
    let userManager: UserManager
    
    init(authManager: AuthManager, userManager: UserManager) {
        self.authManager = authManager
        self.userManager = userManager
    }
    
    private func clearLoginInformation() {
        email = ""
        password = ""
        confirmPassword = ""
    }
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            print("No email or password found.") // handle error
            return
        }
        let authDataResult = try await authManager.createUser(email: email, password: password)
        let user = DBUser(auth: authDataResult)
        try userManager.createNewUser(user: user)
        self.clearLoginInformation()
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Incorrect login information") // handle error
            return
        }
        try await authManager.signIn(email: email, password: password)
        self.clearLoginInformation()
    }
    
    func resetPassword() async throws {
        let authenticatedUser = try authManager.fetchAuthUser()
        
        guard let email = authenticatedUser.email else {
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
