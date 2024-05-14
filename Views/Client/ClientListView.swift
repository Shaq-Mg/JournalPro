//
//  ClientListView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import SwiftUI

struct ClientListView: View {
    @State private var isShowNewClient = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.firstName, order: .forward)]) var clients: FetchedResults<Client>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(clients) { client in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: ClientDetailView(client: client)) {
                            EmptyView()
                        }
                        .opacity(0)
                        ClientRowView(client: client)
                    }
                }
                .onDelete(perform: delete)
            }
            .sheet(isPresented: $isShowNewClient, content: {
                NavigationStack {
                    CreateClientView()
                }
            })
            .navigationTitle("Clients")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowNewClient.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .rotationEffect(Angle(degrees: -90))
                    }
                }
            }
            .font(.title2)
            .fontWeight(.semibold)
        }
    }
    private func delete(offsets: IndexSet) {
        withAnimation {
            offsets.map { _ in clients[0] }.forEach(moc.delete)
            ClientController().save(context: moc)
        }
    }
}

struct ClientListView_Previews: PreviewProvider {
    static var previews: some View {
        ClientListView()
    }
}

struct ClientRowView: View {
    let client: Client
    var body: some View {
        HStack {
            Text("")
                .font(.headline)
                .overlay {
                    Circle()
                        .frame(width: 40, height: 40)
                }
            VStack(alignment: .leading, spacing: 6) {
                Text(client.firstName ?? "")
                    .font(.system(size: 18, design: .rounded).bold())
                
                Text(client.lastName ?? "")
                    .font(.caption.bold())
                    .foregroundStyle(.secondary)
            }
            Spacer()
            if client.isFavourite {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.indigo)
            }
        }
    }
}
