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
    let isPremium: Bool?
    
    init(auth: Profile) {
        self.uid = auth.uid
        self.email = auth.email
        self.dateCreated = Date()
        self.isPremium = false
    }
    
    init(uid: String, email: String? = nil, dateCreated: Date? = nil, isPremium: Bool? = nil) {
        self.uid = uid
        self.email = email
        self.dateCreated = dateCreated
        self.isPremium = isPremium
    }
    
    enum CodingKeys: String, CodingKey {
        case uid = "uid"
        case email = "email"
        case dateCreated = "date_created"
        case isPremium = "is_premium"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uid = try container.decode(String.self, forKey: .uid)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.dateCreated = try container.decodeIfPresent(Date.self, forKey: .dateCreated)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.uid, forKey: .uid)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encode(self.isPremium, forKey: .isPremium)
    }
}
