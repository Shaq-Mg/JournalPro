//
//  ClientController.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import Foundation
import CoreData

class ClientController {
    let container = NSPersistentContainer(name: "ClientModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data has saved successfully")
        } catch {
            print("Unable to save context")
        }
    }
    func addClient(firstName: String, lastName: String, phoneNumber: String,
                   isFavorite: Bool, notes: String, context: NSManagedObjectContext) {
        let client = Client(context: context)
        client.id = UUID()
        client.firstName = firstName
        client.lastName = lastName
        client.phoneNumber = phoneNumber
        client.isFavourite = isFavorite
        client.notes = notes
        
        save(context: context)
    }
    func editClient(client: Client, firstName: String, lastName: String, phoneNumber: String,
                    isFavorite: Bool, notes: String, context: NSManagedObjectContext) {
        client.firstName = firstName
        client.lastName = lastName
        client.phoneNumber = phoneNumber
        client.isFavourite = isFavorite
        client.notes = notes
        
        save(context: context)
    }
}
