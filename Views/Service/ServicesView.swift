//
//  ServicesView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 04/06/2024.
//

import SwiftUI

struct ServicesView: View {
    @EnvironmentObject var vm: ServiceViewModel
    @State private var isShowNewService = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.filteredServices) { service in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: ServiceDetailView(service: service)) {
                            EmptyView()
                        }
                        .opacity(0)
                        ServiceRowView(service: service)
                    }
                }
            }
            .searchable(text: $vm.searchText, prompt: "Search services")
            .onAppear { vm.fetchServices() }
            .sheet(isPresented: $isShowNewService) {
                CreateServiceView()
            }
        }
        .navigationTitle("Services")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    isShowNewService.toggle()
                } label: {
                    CreateNavButton()
                }
            }
        }
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ServicesView()
                .environmentObject(ServiceViewModel())
        }
    }
}

struct ServiceRowView: View {
    let service: Service
    var body: some View {
        HStack {
            Text(service.title)
                .font(.headline)
            Spacer()
            VStack(alignment: .trailing, spacing: 2) {
                Text("Price: £\(service.price)")
                    .foregroundStyle(.black)
                Text("\(service.duration)mins")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
    }
}
