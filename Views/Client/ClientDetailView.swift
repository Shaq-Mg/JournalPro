//
//  ClientDetailView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import SwiftUI

struct ClientDetailView: View {
    let client: Client
    
    var body: some View {
        List {

        }
        .navigationTitle(client.name)
    }
}
struct ClientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClientDetailView(client: Client(id: "12", name: "User", phoneNumber: "07900000000", notes: "none", isFavourite: true))
    }
}
