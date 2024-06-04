//
//  ClientListView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import SwiftUI

struct ClientView: View {
    @State private var isShowNewClient = false
    @StateObject var vm = ClientViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Clients") {
                    ForEach(vm.filteredClients) { client in
                        ZStack(alignment: .leading) {
                            NavigationLink(destination: ClientDetailView(vm: vm, client: client)) {
                                EmptyView()
                            }
                            .opacity(0)
                            ClientRowView(client: client)
                        }
                    }
                }
            }
            .searchable(text: $vm.searchText)
            .onAppear { vm.fetchClients() }
            .sheet(isPresented: $isShowNewClient, content: {
                NavigationStack {
                    CreateClientView()
                }
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowNewClient.toggle()
                    } label: {
                        CreateNavButton()
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
        }.navigationBarBackButtonHidden(true)
    }
}

struct ClientView_Previews: PreviewProvider {
    static var previews: some View {
        ClientView()
    }
}

struct ClientRowView: View {
    let client: Client
    var body: some View {
        HStack {
            Circle()
                .frame(width: 35, height: 35)
                .foregroundStyle(.secondary)
                .overlay {
                    Text((client.name.prefix(1).capitalized))
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                }
            VStack(alignment: .leading, spacing: 6) {
                Text(client.name)
                    .font(.system(size: 18, design: .rounded).bold())
            }
            Spacer()
            if client.isFavourite {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.indigo)
            }
        }
    }
}
