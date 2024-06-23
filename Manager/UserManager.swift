//
//  UserManager.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 23/06/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserManager {
    
    let firestore = Firestore.firestore()
    
    func createNewUser(auth: AppUser) async throws {
        var userData: [String: Any] = [
            "user_id": auth.uid,
            "date_created": Timestamp()
        ]
        if let email = auth.email {
            userData["email"] = email
        }
        try await firestore.collection("users").document(auth.uid).setData(userData, merge: false)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        let snapshot =  try await firestore.collection("users").document(userId).getDocument()
        
        guard let data = snapshot.data(), let userId = data["user_id"] as? String else {
            throw URLError(.badServerResponse) // hnadle error here
        }
        let email = data["email"] as? String
        let date = data["date_created"] as? Date

        return DBUser(uid: userId, email: email, dateCreated: date)
    }
}
