//
//  DBUser.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 23/06/2024.
//

import Foundation

struct DBUser: Codable {
    let uid: String
    let email: String?
    let dateCreated: Date?
    let isPremium: Bool
    
    init(auth: Profile) {
        self.uid = auth.uid
        self.email = auth.email
        self.dateCreated = Date()
        self.isPremium = auth.isPremium
    }
}
