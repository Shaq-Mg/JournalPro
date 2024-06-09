//
//  SelectClientView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 03/06/2024.
//

import SwiftUI

struct SelectClientView: View {
    @EnvironmentObject var vm: AppointmentViewModel
    let didSelectClient: (Client) -> ()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.clients) { client in
                    SelectClientRow(client: client)
                        .onTapGesture {
                            didSelectClient(client)
                            let client = vm.client
                            dismiss()
                        }
                }
            }
            .onAppear { vm.fetchClients() }
            .font(.title2)
            .fontWeight(.semibold)
        }
        .navigationTitle("Select a client")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Cancel") {
                    dismiss()
                }
                .foregroundStyle(.black)
            }
        }
    }
}

struct SelectClientView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SelectClientView(didSelectClient: { _ in })
                .environmentObject(AppointmentViewModel())
        }
    }
}
struct SelectClientRow: View {
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
            VStack(alignment: .leading, spacing: 2) {
                Text(client.name)
                    .font(.system(size: 18, design: .rounded).bold())
                Text(client.nickname ?? "")
                    .font(.system(size: 14, design: .rounded).bold())
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
