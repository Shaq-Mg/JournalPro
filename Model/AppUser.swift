//
//  User.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 30/05/2024.
//

import Foundation
import FirebaseAuth

struct AppUser {
    let uid: String
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}
