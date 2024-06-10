//
//  DayView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 07/06/2024.
//

import SwiftUI

struct DayView: View {
    @EnvironmentObject var vm: AppointmentViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            MenuHeaderView(title: "Date")
            NavigationStack {
                List {
                    Section("Bookings today") {
                        ForEach(vm.appointments) { appointment in
                            HStack(alignment: .top, spacing: 16) {
                                Image(systemName: "pencil")
                                    .padding(12)
                                    .background(.secondary.opacity(0.2))
                                    .clipShape(Circle())
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(appointment.name)
                                    Text(appointment.service.title)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                
                                Text("\(appointment.date)")
                                    .font(.system(size: 10, weight: .semibold))
                            }
                            .font(.system(size: 20, weight: .semibold))
                        }
                    }
                }
                .onAppear { vm.fetchAppointments() }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Cancel") {
                            dismiss()
                        }
                        .font(.headline)
                        .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DayView()
                .environmentObject(AppointmentViewModel())
        }
    }
}
