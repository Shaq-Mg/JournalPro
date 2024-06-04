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
    @Published var nickname = ""
    @Published var notes = ""
    @Published var isFavourite = false
    
    var filteredClients: [Client] {
        guard !searchText.isEmpty else { return clients }
        return clients.filter({ $0.name.localizedCaseInsensitiveContains(searchText)})
    }

    let db = Firestore.firestore()
    
    func fetchClients() {
        db.collection("clients").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.clients = snapshot.documents.map({ doc in
                            return Client(id: doc.documentID, name: doc["name"] as? String ?? "n/a", phoneNumber: doc["phone_number"] as? String ?? "n/a", nickname: doc["nickname"] as? String ?? "n/a", notes: doc["notes"] as? String ?? "n/a", isFavourite: doc["is_favourite"] as? Bool ?? false)
                        })
                    }
                }
            } else {
                // handle error here
            }
        }
    }
    
    func saveClient(name: String, phoneNumber: String, nickname: String?, notes: String?, isFavourite: Bool) {
        db.collection("clients")
            .addDocument(data: ["name": name, "phone_number": phoneNumber, "nickname": nickname ?? "n/a", "notes": notes ?? "n/a", "is_favourite": isFavourite]) { error in
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

        db.collection("clients").document(clientToUpdate.id).setData(["name": clientToUpdate.name, "phone_number": clientToUpdate.phoneNumber,"nickname": clientToUpdate.nickname ?? "n/a", "notes": clientToUpdate.notes ?? "n/a", "is_favourite": clientToUpdate.isFavourite], merge: true)
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
