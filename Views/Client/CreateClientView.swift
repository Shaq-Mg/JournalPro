//
//  CreateClientView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/05/2024.
//

import SwiftUI

struct CreateClientView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var vm = ClientViewModel()
    var body: some View {
        ZStack {
            Color.indigo.opacity(0.5).ignoresSafeArea()
            VStack(spacing: 16) {
                InputView(text: $vm.name, title: "Name", placeholder: "Name")
                InputView(text: $vm.phoneNumber, title: "Phone number", placeholder: "Phone number")
                InputView(text: $vm.notes, title: "Notes", placeholder: "Notes")
                VStack(spacing: 18) {
                    Toggle("Favourite", isOn: $vm.isFavourite)
                        .tint(.indigo)
                    Divider()
                    
                    Button {
                        vm.addClient(name: vm.name, phoneNumber: vm.phoneNumber, notes: vm.notes, isFavourite: vm.isFavourite)
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                    .font(.headline)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1).foregroundStyle(.secondary))
                .shadow(radius: 5)
            }
            .padding(.horizontal)
            .navigationBarTitle("Create Client")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.black)
                }
            }
        .fontWeight(.semibold)
        }
    }
}

struct CreateClientView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateClientView()
        }
    }
}
