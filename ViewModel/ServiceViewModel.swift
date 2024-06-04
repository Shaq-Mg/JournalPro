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
    @Published var searchText = ""
    @Published var title = ""
    @Published var price = ""
    @Published var duration = ""
    
    var filteredServices: [Service] {
        guard !searchText.isEmpty else { return services }
        return services.filter({ $0.title.localizedCaseInsensitiveContains(searchText)})
    }
    
    let db = Firestore.firestore()
    
    func fetchServices() {
        db.collection("services").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    self.services = snapshot.documents.map({ doc in
                        return Service(id: doc.documentID, title: doc["title"] as? String ?? "", price: doc["price"] as? String ?? "", duration: doc["duration"] as? String ?? "")
                    })
                }
            } else {
                // handle error here
            }
        }
    }
    
    func saveService(title: String, price: String, duration: String) {
        db.collection("services").addDocument(data: ["title": title, "price": price, "duration": duration]) { error in
            if error == nil {
                self.fetchServices()
            } else {
                // handle error here
            }
        }
    }
    
    func deleteService(serviceToDelete: Service) {
        db.collection("services").document(serviceToDelete.id).delete { error in
            if error == nil {
                DispatchQueue.main.async {
                    self.services.removeAll { service in
                        return service.id == serviceToDelete.id
                    }
                }
            }
        }
    }
}
