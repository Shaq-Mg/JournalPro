//
//  CreateServiceView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 04/06/2024.
//

import SwiftUI

struct CreateServiceView: View {
    @EnvironmentObject var vm: ServiceViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.indigo.opacity(0.5).ignoresSafeArea()
            VStack(spacing: 16) {
                InputView(text: $vm.title, title: "Title", placeholder: "Title")
                HStack {
                    InputView(text: $vm.price, title: "Price", placeholder: "Price")
                        .keyboardType(.decimalPad)
                    Spacer()
                        InputView(text: $vm.duration, title: "Duration", placeholder: "Duration")
                        .keyboardType(.decimalPad)
                }
                Button {
                    vm.saveService(title: vm.title, price: vm.price, duration: vm.duration)
                    dismiss()
                } label: {
                    Text("Save")
                }
                .foregroundStyle(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.black)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1).foregroundStyle(.secondary))
                .shadow(radius: 5)
            }
            .padding(.horizontal)
            .navigationBarTitle("Create Client")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
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

struct CreateServiceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateServiceView()
                .environmentObject(ServiceViewModel())
        }
    }
}
