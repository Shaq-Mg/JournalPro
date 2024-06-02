//
//  CreateAppointmentView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 02/06/2024.
//

import SwiftUI

struct CreateAppointmentView: View {
    @StateObject var vm = AppointmentViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading) {
                Text("Name")
                    .font(.callout)
                TextField("Name (optional)", text: $vm.name)
                    .font(.title2)
                    .textFieldStyle(.roundedBorder)
                    .frame(maxWidth: .infinity)
            }
            DatePicker("Select a date", selection: $vm.selectedDate)
            Divider()
            
            VStack(alignment: .leading) {
                Text("Select a client")
                ScrollView(.horizontal) {
                    HStack(spacing: 14) {
                        ForEach(vm.clients) { client in
                            Text(client.name)
                                .padding(12)
                                .overlay{ RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1) }
                                .padding(.vertical)
                        }
                    }
                }
                Divider()
                Text("Select a service")
                ScrollView(.horizontal) {
                    HStack(spacing: 14) {
                        ForEach(vm.services) { service in
                            if vm.services.isEmpty {
                                Text("No services")
                            } else {
                                Text(service.title)
                                    .padding(12)
                                    .overlay{ RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1) }
                                    .padding(.vertical)
                            }
                        }
                    }
                }
                Divider()
            }

            Button {
                
            } label: {
                Text("Save").bold()
            }
            
        }
        .onAppear{ vm.fetchClients() }
        .padding(.horizontal)
    }
}

struct CreateAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAppointmentView()
    }
}
