//
//  ServicesView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 04/06/2024.
//

import SwiftUI

struct ServicesView: View {
    @EnvironmentObject var vm: ServiceViewModel
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.services) { service in
                    if vm.services.isEmpty {
                        Text("No services")
                    } else {
                        HStack {
                            Text(service.title)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Price: \(service.price)")
                                Text("Duration: \(service.duration)")
                            }
                        }
                    }
                }
            }
        }.navigationTitle("Services")
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ServicesView()
                .environmentObject(ServiceViewModel())
        }
    }
}
