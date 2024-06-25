//
//  SignUpView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 21/06/2024.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: SignInViewModel
    
    init(authManager: AuthManager, userManager: UserManager) {
        _viewModel = ObservedObject(wrappedValue: SignInViewModel(authManager: authManager, userManager: userManager))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.indigo.opacity(0.8).ignoresSafeArea()
                VStack(spacing: 20) {
                    VStack(spacing: 8) {
                        
                        InputView(text: $viewModel.email, title: "Email", placeholder: "User@hotmail.com")
                        
                        InputView(text: $viewModel.password, title: "Password", placeholder: "password", isSecureField: true)
                        
                        InputView(text: $viewModel.confirmPassword, title: "Confirm password", placeholder: "Confirm password", isSecureField: true)
                    }
                    Button {
                        Task {
                            do {
                                try await viewModel.signUp()
                                viewModel.loginStatusMessage = "Successflly created user inoformation"
                                dismiss()
                            } catch {
                                print("Failed to save user to database \(error)")
                                viewModel.loginStatusMessage = "Failed to login user: \(error)"
                            }
                        }
                    } label: {
                        Text("Sign Up")
                            .font(.system(size: 20).bold())
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Button("Already have a existing account? Sign in") {
                        dismiss()
                    }
                    .font(.callout)
                    .foregroundStyle(.black)
                    
                    Text(viewModel.loginStatusMessage)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                .onAppear {
                    viewModel.email = ""
                    viewModel.password = ""
                    viewModel.confirmPassword = ""
                    viewModel.loginStatusMessage = ""
                }
            }
        }
        .navigationTitle("Create account")
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static let authManager = AuthManager()
    static let userManager = UserManager()
    
    static var previews: some View {
        NavigationStack {
            SignUpView(authManager: authManager, userManager: userManager)
        }
    }
}
