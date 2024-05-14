//
//  Client.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import Foundation
import CoreData

final class ClientDataModel: NSManagedObject, Identifiable {
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var phoneNumber: String
    @NSManaged var isFavourite: Bool
    @NSManaged var notes: String
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        setPrimitiveValue(false, forKey: "isFavourite")
    }
    var initials: String {
        let firstInitial = firstName.prefix(1)
        let lastInitial = lastName.prefix(1)
        return "\(firstInitial)\(lastInitial)"
    }
}
