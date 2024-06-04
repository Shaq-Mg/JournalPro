//
//  ServiceDetailView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 04/06/2024.
//

import SwiftUI

struct ServiceDetailView: View {
    @EnvironmentObject var vm: ServiceViewModel
    @State private var showDeleteAlert = false
    @Environment(\.dismiss) private var dismiss
    let service: Service
    
    var body: some View {
        NavigationStack {
            List {
                Section("General") {
                    HStack {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.secondary)
                            .overlay {
                                Text((service.title.prefix(1).capitalized))
                                    .font(.title3.bold())
                                    .foregroundStyle(.white)
                            }
                        Text(service.title)
                            .font(.title2.bold())
                    }
                    HStack {
                        Text("Title:")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text(service.title)
                    }
                    HStack {
                        Text("Price:")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text(service.price)
                    }
                    HStack {
                        Text("Duration:")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text("\(service.duration)")
                    }
                }
                .fontWeight(.semibold)
                Section("Update") {
                    Button {
                        showDeleteAlert = true
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
            .confirmationDialog("Delete Client", isPresented: $showDeleteAlert) {
                Button("Yes") { vm.deleteService(serviceToDelete: service) }
            } message: {
                Text("Are you sure you want to delete this client?")
            }
            .navigationTitle("Service info")
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
}

struct ServiceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ServiceDetailView(service: Service(id: "1234", title: "Haircut", price: "£15", duration: "40 mins"))
                .environmentObject(ServiceViewModel())
        }
    }
}
