//
//  Service.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 31/05/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Service: Identifiable, Codable {
    @DocumentID var id: String?
    let title, price: String
    let duration: String
//    init(data: [String: Any]) {
//        self.title = data[FirebaseConstants.title] as? String ?? "n/a"
//        self.price = data[FirebaseConstants.price] as? String ?? "n/a"
//    }
}
