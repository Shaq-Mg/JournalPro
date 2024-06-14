//
//  ApptRowView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/06/2024.
//

import SwiftUI

struct ApptRowView: View {
    let appointment: Appointment
    var body: some View {
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
            
            Text("\(appointment.date.dayViewDateFormat())")
                .font(.system(size: 10, weight: .semibold))
        }
        .font(.system(size: 20, weight: .semibold))
    }
}

struct ApptRowView_Previews: PreviewProvider {
    static var previews: some View {
        ApptRowView(appointment: Appointment(name: "Kobe", service: Service(id: "1234", title: "Haircut", price: "£20", duration: "40mins"), date: Date()))
    }
}
