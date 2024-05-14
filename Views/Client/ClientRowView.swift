//
//  ClientRowView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import SwiftUI

struct ClientRowView: View {
    @Environment(\.managedObjectContext) var moc
    let client: Client
    var body: some View {

    }
}

struct ClientRowView_Previews: PreviewProvider {
    static var previews: some View {
        var client = Client()
        ClientRowView(client: client)
    }
}
