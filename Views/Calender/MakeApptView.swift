//
//  MakeApptView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 09/06/2024.
//

import SwiftUI

struct MakeApptView: View {
    @EnvironmentObject var vm: CalenderViewModel
    @State var selectedDate = Date()
    @State private var name = ""
    var currentDate: Date
    
    var body: some View {
        VStack {
            MenuHeaderView(title: "Book appointment")
            NavigationStack {
                VStack(spacing: 30) {
                    Text(currentDate.dayOfTheWeek())
                        .font(.system(size: 16, weight: .semibold))
                    ApptInputView(text: $name, title: "Name", placeholder: "Name")
                    
                    Text("Select a time")
                        .font(.system(size: 16, weight: .semibold))
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(vm.times, id: \.self) { time in
                                Button {
                                    if !name.isEmpty {
                                        withAnimation {
                                            selectedDate = time
                                            vm.showConfirmedAppt = true
                                        }
                                    }
                                } label: {
                                    Text(time.timeFromDate())
                                        .bold()
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .fullScreenCover(isPresented: $vm.showConfirmedAppt) {
                    NavigationStack {
                        ConfirmedBookingView(currentDate: currentDate)
                            .environmentObject(AppointmentViewModel())
                    }
                }
            }
        }
    }
}

struct MakeApptView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MakeApptView(currentDate: Date())
                .environmentObject(CalenderViewModel())
        }
    }
}
