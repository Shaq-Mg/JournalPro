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
    let notes: String?
    let isFavourite: Bool
}
