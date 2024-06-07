//
//  SelectServiceView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 07/06/2024.
//

import SwiftUI

struct SelectServiceView: View {
    @EnvironmentObject var vm: AppointmentViewModel
    let didSelectService: (Service) -> ()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.services) { service in
                   ServiceRowView(service: service)
                        .onTapGesture {
                            didSelectService(service)
                            dismiss()
                        }
                }
            }
            .onAppear { vm.fetchServices() }
        }
        .navigationTitle("Services")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {

                } label: {
                    CreateNavButton()
                }
            }
        }
    }
}

struct SelectServiceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SelectServiceView(didSelectService: { _ in })
                .environmentObject(AppointmentViewModel())
        }
    }
}
