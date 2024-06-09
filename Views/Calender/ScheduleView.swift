//
//  ScheduleView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 09/06/2024.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var vm: CalenderViewModel
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                CalenderHeaderView(selectedDate: $vm.selectedDate)
                
                HStack {
                    ForEach(vm.days, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity)
                    }
                }
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                    ForEach(vm.fetchDates()) { value in
                        ZStack {
                            if value.day != -1 {
                                Text("\(value.day)")
                            } else {
                                Text("")
                                    .padding()
                                    .background(.indigo.opacity(0.2))
                                    .clipShape(Circle())
                            }
                        }
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 32, height: 32)
                    }
                }
            }
            .navigationTitle("Schedule")
            .padding(.horizontal)
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ScheduleView()
                .environmentObject(CalenderViewModel())
        }
    }
}
