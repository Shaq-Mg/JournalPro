//
//  CreateAppointmentView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 02/06/2024.
//

import SwiftUI

struct CreateAppointmentView: View {
    @EnvironmentObject var vm: AppointmentViewModel
    let didSaveAppointment: (Appointment) -> ()
    
    var body: some View {
        NavigationStack {
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
                    HStack {
                        NavigationLink {
                            SelectClientView(didSelectClient: { client in
                                vm.client = client })
                            .environmentObject(vm)
                        } label: {
                            Text("Select client")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.white)
                                .padding(12)
                                .background(.indigo)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        Spacer()
                        if let client = vm.client {
                            Text(client.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1))
                        }
                    }
                    
                    
                    Divider()
                    HStack {
                        NavigationLink {
                            SelectServiceView(didSelectService: { service in
                                vm.service = service })
                            .environmentObject(vm)
                        } label: {
                            Text("Select service")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.white)
                                .padding(12)
                                .background(.indigo)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        Spacer()
                        Spacer()
                        if let service = vm.service {
                            Text(service.title)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1))
                        }
                    }
                    Divider()
                }
                
                Button {
                    vm.save(name: vm.name, service: vm.appointment?.service ?? Service(id: "", title: "", price: "", duration: "0"), date: vm.selectedDate)
                    vm.bookingConfirmed.toggle()
                } label: {
                    Text("Confirm").bold()
                }
            }
            .navigationTitle("Book appointment")
            .onAppear{ vm.fetchClients() }
            .padding(.horizontal)
            .fullScreenCover(isPresented: $vm.bookingConfirmed, content: {
                NavigationStack {
                    ConfirmedBookingView()
                        .environmentObject(vm)
                }
            })
        }
    }
}

struct CreateAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateAppointmentView(didSaveAppointment: { _ in })
                .environmentObject(AppointmentViewModel())
        }
    }
}
