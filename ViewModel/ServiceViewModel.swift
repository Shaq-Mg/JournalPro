//
//  ServiceViewModel.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 04/06/2024.
//

import Foundation
import Firebase

class ServiceViewModel: ObservableObject {
    @Published var services = [Service]()
    
    let db = Firestore.firestore()
    
    func fetchServices() {
        db.collection("services").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    self.services = snapshot.documents.map({ doc in
                        return Service(id: doc.documentID, title: doc["title"] as? String ?? "", price: doc["price"] as? String ?? "", duration: doc["duration"] as? Int ?? 0)
                    })
                }
            } else {
                // handle error here
            }
        }
    }
    
    func saveService(title: String, price: String, duration: Int) {
        db.collection("services").addDocument(data: ["title": title, "price": price, "duration": duration]) { error in
            if error == nil {
                self.fetchServices()
            } else {
                // handle error here
            }
        }
    }
}
