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
    
    init(authManager: AuthManager) {
        _viewModel = ObservedObject(wrappedValue: SignInViewModel(authManager: authManager))
    }
    
    var body: some View {
        ZStack {
            HomeView(showSignedInView: $showSignedInView, authManager: viewModel.authManager)
        }
        .onAppear {
            let authUser = try? viewModel.authManager.fetchAuthUser()
            self.showSignedInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignedInView) {
            SignInView(authManager: viewModel.authManager)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static let authManager = AuthManager()
    
    static var previews: some View {
        NavigationStack {
            RootView(authManager: authManager)
        }
    }
}
