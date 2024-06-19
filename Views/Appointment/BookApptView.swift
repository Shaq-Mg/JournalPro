//
//  CreateAppointmentView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 02/06/2024.
//

import SwiftUI

struct BookApptView: View {
    @EnvironmentObject var vm: AppointmentViewModel
    let didSaveAppointment: (Appointment) -> ()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(.callout)
                    TextField("Name", text: $vm.name)
                        .font(.title2)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: .infinity)
                }
                DatePicker("Select a date", selection: $vm.selectedDate)
                Divider()
                
                VStack(alignment: .leading) {
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
                        if (vm.service != nil) {
                            Text(vm.service?.title ?? "")
                                .font(.system(size: 12, weight: .semibold))
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1))
                        }
                    }
                    Divider()
                }
                
                Button {
                    if !vm.name.isEmpty && vm.service != nil {
                        vm.createAppt(name: vm.name, date: vm.selectedDate)
                        vm.bookingConfirmed.toggle()
                    }
                } label: {
                    Text("Confirm").bold()
                }
            }
            .navigationTitle("Book appointment")
            .onAppear{ vm.fetchClients() }
            .padding(.horizontal)
            .fullScreenCover(isPresented: $vm.bookingConfirmed, content: {
                NavigationStack {
                    ConfirmedBookingView(currentDate: vm.selectedDate)
                        .environmentObject(vm)
                }
            })
        }
    }
}

struct BookApptView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BookApptView(didSaveAppointment: { _ in })
                .environmentObject(AppointmentViewModel())
        }
    }
}
