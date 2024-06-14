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
            MenuHeaderView(isNavigate: true, isPressed: { dismiss() }, title: "Day")
            NavigationStack {
                List {
                    Section("Bookings today") {
                        ForEach(vm.appointments) { appointment in
                            ApptRowView(appointment: appointment)
                        }
                    }
                }
                .onAppear { vm.fetchAppointments() }
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
