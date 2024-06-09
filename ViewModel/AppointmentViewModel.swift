//
//  AppointmentViewModel.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 02/06/2024.
//

import Foundation
import Combine
import Firebase

final class AppointmentViewModel: ObservableObject {
    @Published var appointments = [Appointment]()
    @Published var clients = [Client]()
    @Published var services = [Service]()
    @Published var searchText = ""
    @Published var name = ""
    @Published var selectedDate = Date()
    @Published var appointment: Appointment? = nil
    @Published var client: Client? = nil
    @Published var service: Service? = nil
    @Published var bookingConfirmed = false
    
    let db = Firestore.firestore()
    
    func fetchAppointments() {
        db.collection("appointments").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.appointments = snapshot.documents.map({ doc in
                            return Appointment(name: doc["name"] as! String, service: Service(id: doc.documentID, title: doc["title"] as? String ?? "n/a", price: doc["price"] as? String ?? "n/a", duration: doc["duration"] as? String ?? ""), date: doc["date"] as? Date ?? Date())
                        })
                    }
                }
            } else {
                // handle error here
            }
        }
    }
    
    func save(name: String?, service: Service, date: Date) {
        db.collection("appointments")
            .addDocument(data: ["name": name ?? "-", "service": service, "date": date]) { error in
                if error == nil {
                    self.fetchAppointments()
                    print("Successfully to saved appointment to firestore")
                } else {
                    // handle error here
                    print("Failed to save appointment to firestore")
                }
            }
    }
    
    func update(appointmentToUpdate: Appointment) {

        db.collection("appointments").document(appointmentToUpdate.id ?? "").setData(["name": appointmentToUpdate.name, "service": appointmentToUpdate.service, "date": appointmentToUpdate.date], merge: true)
    }
    
    func delete(appointmentToDelete: Client) {
        let db = Firestore.firestore()
        db.collection("appointments").document(appointmentToDelete.id).delete { error in
            if error == nil {
                DispatchQueue.main.async {
                    self.appointments.removeAll { appointment in
                        return appointment.id == appointmentToDelete.id
                    }
                }
            } else {
                // handle error here
                print("Failed to delete appointment to firestore")
            }
        }
    }
    
    func fetchClients() {
        db.collection("clients").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.clients = snapshot.documents.map({ doc in
                            return Client(id: doc.documentID, name: doc["name"] as? String ?? "n/a", phoneNumber: doc["phone_number"] as? String ?? "n/a", nickname: doc["nickname"] as? String ?? "n/a", notes: doc["notes"] as? String ?? "-", isFavourite: doc["is_favourite"] as? Bool ?? false)
                        })
                    }
                }
            } else {
                // handle error here
            }
        }
    }
    
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
}
