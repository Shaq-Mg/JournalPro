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
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    func createNewUser(user: DBUser) throws {
        try userDocument(userId: user.uid).setData(from: user,merge: false, encoder: encoder)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self, decoder: decoder)
    }
}
