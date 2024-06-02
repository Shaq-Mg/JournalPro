//
//  ClientViewModel.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 31/05/2024.
//

import Foundation
import Firebase

final class ClientViewModel: ObservableObject {
    @Published var clients = [Client]()
    @Published var searchText = ""
    @Published var name = ""
    @Published var phoneNumber = ""
    @Published var notes = ""
    @Published var isFavourite = false
    
    let db = Firestore.firestore()
    
    func fetchClients() {
        db.collection("clients").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.clients = snapshot.documents.map({ doc in
                            return Client(id: doc.documentID, name: doc["name"] as? String ?? "n/a", phoneNumber: doc["phone_number"] as? String ?? "n/a", notes: doc["notes"] as? String ?? "-", isFavourite: doc["is_favourite"] as? Bool ?? false)
                        })
                    }
                }
            } else {
                // handle error here
            }
        }
    }
    
    func saveClient(name: String, phoneNumber: String, notes: String?, isFavourite: Bool) {
        db.collection("clients")
            .addDocument(data: ["name": name, "phone_number": phoneNumber, "notes": notes ?? "-", "is_favourite": isFavourite]) { error in
                if error == nil {
                    self.fetchClients()
                    print("Successfully to saved client to firestore")
                } else {
                    // handle error here
                    print("Failed to save client to firestore")
                }
            }
    }
    
    func updateClient(clientToUpdate: Client) {

        db.collection("clients").document(clientToUpdate.id).setData(["name": clientToUpdate.name, "phone_number": clientToUpdate.phoneNumber, "notes": clientToUpdate.notes ?? "", "is_favourite": clientToUpdate.isFavourite], merge: true)
    }
    
    func deleteClient(clientToDelete: Client) {
        let db = Firestore.firestore()
        db.collection("clients").document(clientToDelete.id).delete { error in
            if error == nil {
                DispatchQueue.main.async {
                    self.clients.removeAll { client in
                        return client.id == clientToDelete.id
                    }
                }
            } else {
                // handle error here
                print("Failed to delete client to firestore")
            }
        }
    }
}
