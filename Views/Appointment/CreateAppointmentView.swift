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
                    NavigationLink {
                        
                    } label: {
                        Text("Select client")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(12)
                            .background(.indigo)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }

                    
                    Divider()
                    NavigationLink {
                        
                    } label: {
                        Text("Select service")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(12)
                            .background(.indigo)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    Divider()
                }
                
                Button {
                    
                } label: {
                    Text("Confirm").bold()
                }
            }
            .navigationTitle("Book appointment")
            .onAppear{ vm.fetchClients() }
            .padding(.horizontal)
        }
    }
}

struct CreateAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateAppointmentView()
        }
    }
}
