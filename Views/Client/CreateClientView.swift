//
//  CreateClientView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import SwiftUI

struct CreateClientView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var vm = ClientViewModel()
    var body: some View {
        List {
            Section("General") {
                TextField("Name", text: $vm.name)
                    .keyboardType(.namePhonePad)
                
                TextField("Phone number", text: $vm.phoneNumber)
                .keyboardType(.phonePad)
                
                Toggle("Favourite", isOn: $vm.isFavourite)
            }
            
            Section("Notes") {
                TextField("Add description", text: $vm.notes)
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
