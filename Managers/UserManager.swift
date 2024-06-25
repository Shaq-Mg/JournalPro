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
    
    private let firestore = Firestore.firestore()
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    func createNewUser(user: DBUser) throws {
        try userDocument(userId: user.uid).setData(from: user,merge: false)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self)
    }
    
    func updatePremiumStatus(userId: String, isPremium: Bool) async throws {
        var data: [String:Any] = [ DBUser.CodingKeys.isPremium.rawValue: isPremium ]
        
        try await userDocument(userId: userId).updateData(data)
    }
}
