//
//  ConfirmedBookingView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 03/06/2024.
//

import SwiftUI

struct ConfirmedBookingView: View {
    @ObservedObject var vm: AppointmentViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            Spacer()
            if let apppointment = vm.appointment {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "pencil.line")
                        Text(vm.appointment?.name ?? "n/a")
                    }
                    HStack {
                        Image(systemName: "person")
                        Text(vm.appointment?.client?.name ?? "n/a")
                    }
                    HStack {
                        Image(systemName: "book")
                        Text(vm.appointment?.service.title ?? "n/a")
                    }
                    HStack {
                        Image(systemName: "clock")
                        Text("\(vm.appointment?.date ?? Date())")
                    }
                }
            } else {
                Text("No confirmed booking")
            }
            Spacer()
            Button("Done") {
                dismiss()
            }
            .padding()
            .font(.system(size: 20, weight: .bold))
        }
    }
}

struct ConfirmedBookingView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmedBookingView(vm: AppointmentViewModel())
    }
}
