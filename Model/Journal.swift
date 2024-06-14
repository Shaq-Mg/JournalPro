//
//  Journal.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/06/2024.
//

import Foundation
import FirebaseFirestoreSwift

struct Journal: Identifiable, Hashable {
    @DocumentID var id: String?
    let booking: Int
    let date: Date
}
