//
//  User.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 30/05/2024.
//

import Foundation
import FirebaseAuth

struct Profile {
    let uid: String
    let email: String?
    let isPremium: Bool
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.isPremium = false
    }
}
