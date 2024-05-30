//
//  SignInViewModel.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 30/05/2024.
//

import Foundation
import FirebaseAuth

final class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        Task {
            do {
                let returnedUser = try await authManager.createUser(email: email, password: password)
                print("Success")
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
