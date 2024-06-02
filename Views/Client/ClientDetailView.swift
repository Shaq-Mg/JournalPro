//
//  ClientDetailView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import SwiftUI

struct ClientDetailView: View {
    @ObservedObject var vm: ClientViewModel
    @State private var showConfirmation = false
    @Environment(\.dismiss) private var dismiss
    let client: Client
    
    var body: some View {
        List {
            Section("General") {
                HStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.secondary)
                        .overlay {
                            Text((client.name.prefix(1).capitalized))
                                .font(.title3.bold())
                                .foregroundStyle(.white)
                        }
                    Text(client.name)
                        .font(.title2.bold())
                }
                HStack {
                    Text("Phone number:")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text(client.phoneNumber)
                }
                HStack {
                    Text("Nickname:")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text(client.nickname ?? "n/a")
                }
                HStack {
                    Text("Notes:")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text(client.notes ?? "n/a")
                }
                HStack {
                    Text("Favourite:")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text("\(client.isFavourite.description)")
                }
            }
            .fontWeight(.semibold)
            Section("Update") {
                Button {
                    showConfirmation = true
                } label: {
                    HStack {
                        Image(systemName: "minus.circle")
                        Text("Delete")
                    }
                    .font(.headline)
                    .foregroundStyle(.indigo)
                    .padding(.vertical)
                }
            }
        }
        .confirmationDialog("Delete Client", isPresented: $showConfirmation) {
            Button("Yes") { vm.deleteClient(clientToDelete: client) }
        } message: {
            Text("Are you sure you want to delete this client?")
        }
        .navigationTitle(client.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}
struct ClientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ClientDetailView(vm: ClientViewModel(), client: Client(id: "12", name: "User", phoneNumber: "07900000000", nickname: "user123", notes: "none", isFavourite: true))
        }
    }
}
