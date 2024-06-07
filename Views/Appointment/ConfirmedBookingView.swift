//
//  ConfirmedBookingView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 03/06/2024.
//

import SwiftUI

struct ConfirmedBookingView: View {
    @EnvironmentObject var vm: AppointmentViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(vm.appointment?.date ?? Date())")
                Spacer()
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 10) {
                        Image(systemName: "person")
                        Text(vm.appointment?.client?.name ?? "n/a")
                    }
                    HStack(spacing: 10) {
                        Image(systemName: "book")
                        Text(vm.appointment?.service.title ?? "n/a")
                    }
                    HStack(spacing: 10) {
                        Image(systemName: "clock")
                        Text("\(vm.appointment?.date ?? Date())")
                    }
                }
                .onAppear { vm.fetchAppointments() }
                .font(.title2)
                .fontWeight(.semibold)
                
                Spacer()
                Button("Done") {
                    dismiss()
                }
                .foregroundStyle(.white)
                .font(.headline)
                .padding()
                .background(.indigo)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.horizontal)
        }
        .navigationTitle("Booking confirmed")
    }
}

struct ConfirmedBookingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ConfirmedBookingView()
                .environmentObject(AppointmentViewModel())
        }
    }
}
