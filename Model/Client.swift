//
//  Client.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 31/05/2024.
//

import Foundation

struct Client: Identifiable, Codable {
    var id: String
    let name, phoneNumber: String
    let nickname, notes: String?
    let isFavourite: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case phoneNumber = "phone_number"
        case nickname = "nickname"
        case notes = "notes"
        case isFavourite = "is_favourite"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        self.nickname = try container.decodeIfPresent(String.self, forKey: .nickname)
        self.notes = try container.decodeIfPresent(String.self, forKey: .notes)
        self.isFavourite = try container.decode(Bool.self, forKey: .isFavourite)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.phoneNumber, forKey: .phoneNumber)
        try container.encodeIfPresent(self.nickname, forKey: .nickname)
        try container.encodeIfPresent(self.notes, forKey: .notes)
        try container.encode(self.isFavourite, forKey: .isFavourite)
    }
}
