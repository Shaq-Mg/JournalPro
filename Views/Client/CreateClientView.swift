//
//  CreateClientView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import SwiftUI

struct CreateClientView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) private var dismiss
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var notes = ""
    @State private var isFavourite = false
    var body: some View {
        List {
            Section("General") {
                TextField("First name", text: $firstName)
                    .keyboardType(.namePhonePad)
                
                TextField("Last name", text: $lastName)
                    .keyboardType(.namePhonePad)
                
                TextField("Phone number", text: $phoneNumber)
                .keyboardType(.phonePad)
                
                Toggle("Favourite", isOn: $isFavourite)
            }
            
            Section("Notes") {
                TextField("Add description", text: $notes)
            }
        }
        .navigationBarTitle("Create Client")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                        ClientController().addClient(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, isFavorite: isFavourite, notes: notes, context: moc)
                        dismiss()
                }
            }
        }
        .fontWeight(.semibold)
    }
}

struct CreateClientView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateClientView()
        }
    }
}
