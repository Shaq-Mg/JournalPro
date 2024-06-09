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
}
