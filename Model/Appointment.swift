//
//  Appointment.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 31/05/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Appointment: Identifiable, Codable {
    @DocumentID var id: String?
    let name: String
    let service: Service
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case service = "sevice"
        case date = "date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try container.decode(DocumentID<String>.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.service = try container.decode(Service.self, forKey: .service)
        self.date = try container.decode(Date.self, forKey: .date)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self._id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.service, forKey: .service)
        try container.encode(self.date, forKey: .date)
    }
}
