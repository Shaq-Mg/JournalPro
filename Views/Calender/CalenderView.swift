//
//  CalenderView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 07/06/2024.
//

import SwiftUI

struct CalenderView: View {
    @EnvironmentObject var vm: CalenderViewModel
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                CalenderHeaderView(selectedDate: $vm.selectedDate)
                
                HStack {
                    ForEach(vm.days, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity)
                    }
                }
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                    ForEach(vm.fetchDates()) { value in
                        VStack {
                            if value.day != -1 {
                                NavigationLink {
                                    MakeApptView(currentDate: value.date)
                                        .environmentObject(vm)
                                } label: {
                                    Text("\(value.day)")
                                        .bold()
                                        .foregroundStyle(.black)
                                        .background(
                                            ZStack {
                                                if value.date.monthDayYearFormat() == Date().monthDayYearFormat() {
                                                    Circle()
                                                        .frame(width: 34, height: 34)
                                                        .foregroundStyle(.blue.opacity(0.2))
                                                }
                                            })
                                }
                                
                            } else {
                                Text("")
                            }
                        }
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 32, height: 32)
                    }
                }
            }
            .navigationTitle("Select a date")
            .navigationBarBackButtonHidden(true)
            .padding(.horizontal)
            .onChange(of: vm.selectedMonth) { newValue in
                vm.selectedDate = vm.fetchSelectedMonth()
            }
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CalenderView()
                .environmentObject(CalenderViewModel())
        }
    }
}
