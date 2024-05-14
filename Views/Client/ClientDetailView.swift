//
//  ClientDetailView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import SwiftUI

struct ClientDetailView: View {
    @Environment(\.managedObjectContext) private var moc
    let client: Client
    
    var body: some View {
        List {
            Section("General") {
                LabeledContent {
                    Text(client.firstName ?? "")
                } label: {
                    Text("First name")
                }
                LabeledContent {
                    Text(client.lastName ?? "")
                } label: {
                    Text("Last name")
                }
                LabeledContent {
                    Text(client.phoneNumber ?? "")
                } label: {
                    Text("Phone number")
                }
                Button {
                    client.isFavourite.toggle()
                } label: {
                    Text("Favourite?")
                        .foregroundStyle(client.isFavourite ? .indigo : .secondary)
                }
                
            }
            Section("Notes") {
                LabeledContent {
                    Text(client.notes ?? "")
                } label: {
                    Text("Notes")
                }
            }
        }
        .navigationTitle((client.firstName ?? "") + (client.lastName ?? ""))
    }
}
//struct ClientDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClientDetailView()
//    }
//}
