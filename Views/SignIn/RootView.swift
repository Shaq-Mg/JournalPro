//
//  RootView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 22/06/2024.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var viewModel: SignInViewModel
    @State private var showSignedInView = false
    
    init(authManager: AuthManager, userManager: UserManager) {
        _viewModel = ObservedObject(wrappedValue: SignInViewModel(authManager: authManager, userManager: userManager))
    }
    
    var body: some View {
        ZStack {
            HomeView(viewModel: ProfileViewModel(authManager: viewModel.authManager, userManager: viewModel.userManager), showSignedInView: $showSignedInView)
        }
        .onAppear {
            let authUser = try? viewModel.authManager.fetchAuthUser()
            self.showSignedInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignedInView) {
            SignInView(authManager: viewModel.authManager, userManager: viewModel.userManager)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static let authManager = AuthManager()
    static let userManager = UserManager()
    
    static var previews: some View {
        NavigationStack {
            RootView(authManager: authManager, userManager: userManager)
        }
    }
}
