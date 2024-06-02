//
//  AppointmentViewModel.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 02/06/2024.
//

import Foundation
import Firebase

final class AppointmentViewModel: ObservableObject {
    @Published var appointments = [Appointment]()
    @Published var clients = [Client]()
    @Published var services = [Service]()
    @Published var name = ""
    @Published var selectedDate = Date()
    @Published var selectedClient: Client? = nil
    @Published var selectedService: Service? = nil
    
    let db = Firestore.firestore()

    
    func fetchAppointments() {
        db.collection("appointments").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.appointments = snapshot.documents.map({ doc in
                            return Appointment(name: doc["name"] as? String ?? "n/a", service: Service(title: doc["title"] as? String ?? "n/a", price: doc["price"] as? String ?? "n/a", duration: doc["duration"] as? Int ?? 0), client: Client(id: doc.documentID, name: doc["name"] as? String ?? "n/a", phoneNumber: doc["phone_number"] as? String ?? "n/a", notes: doc["notes"] as? String ?? "n/a", isFavourite: doc["is_favourite"] as? Bool ?? false), date: doc["date"] as? Date ?? Date())
                        })
                    }
                }
            } else {
                // handle error here
            }
        }
    }
    
    func saveAppointment(name: String?, service: Service, client: Client?, date: Date) {
        db.collection("appointments")
            .addDocument(data: ["name": name ?? "n/a", "Service": service, "client": client ?? "n/a", "date": date]) { error in
                if error == nil {
                    self.fetchAppointments()
                    print("Successfully to saved appointment to firestore")
                } else {
                    // handle error here
                    print("Failed to save appointment to firestore")
                }
            }
    }
    
    func updateClient(appointmentToUpdate: Appointment) {

        db.collection("appointments").document(appointmentToUpdate.id ?? "").setData(["name": appointmentToUpdate.name ?? "n/a", "client": appointmentToUpdate.client ?? "n/a", "service": appointmentToUpdate.service, "date": appointmentToUpdate.date], merge: true)
    }
    
    func deleteAppointment(appointmentToDelete: Client) {
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
                            return Client(id: doc.documentID, name: doc["name"] as? String ?? "n/a", phoneNumber: doc["phone_number"] as? String ?? "n/a", notes: doc["notes"] as? String ?? "-", isFavourite: doc["is_favourite"] as? Bool ?? false)
                        })
                    }
                }
            } else {
                // handle error here
            }
        }
    }
}
