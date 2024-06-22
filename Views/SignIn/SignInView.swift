//
//  SignInView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 31/05/2024.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel: SignInViewModel
    
    init(authManager: AuthManager) {
        _viewModel = ObservedObject(wrappedValue: SignInViewModel(authManager: authManager))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.indigo.opacity(0.8).ignoresSafeArea()
                VStack(spacing: 20) {
                    VStack(spacing: 8) {
                        InputView(text: $viewModel.email, title: "Email", placeholder: "User@hotmail.com")
                        
                        InputView(text: $viewModel.password, title: "Password", placeholder: "password", isSecureField: true)
                    }
                    Button {
                        
                    } label: {
                        Text("Sign In")
                            .font(.system(size: 20).bold())
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    NavigationLink("Dont have a account? Sign up") {
                        SignUpView(authManager: viewModel.authManager)
                    }
                    .font(.callout)
                    .foregroundStyle(.black)
                    Text(viewModel.loginStatusMessage)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Sign In")
        .navigationBarBackButtonHidden(true)
    }
}
struct SignInView_Previews: PreviewProvider {
    static let authManager = AuthManager()
    
    static var previews: some View {
        NavigationStack {
            SignInView(authManager: authManager)
        }
    }
}
