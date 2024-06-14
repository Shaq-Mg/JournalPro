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
        VStack {
            MenuHeaderView(isPressed: { }, title: "Select a date")
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
                                    let hasAppts = vm.availableDays.contains(value.date.monthDayYearFormat())
                                    NavigationLink {
                                        MakeApptView(currentDate: value.date)
                                            .environmentObject(vm)
                                    } label: {
                                        Text("\(value.day)")
                                            .bold()
                                            .foregroundStyle(value.date.monthDayYearFormat() == Date().monthDayYearFormat() ? .white : .black)
                                            .background(
                                                ZStack(alignment: .bottom) {
                                                    Circle()
                                                        .frame(width: 34, height: 34)
                                                        .foregroundStyle(.clear)
                                                    ZStack {
                                                        if value.date.monthDayYearFormat() == Date().monthDayYearFormat() {
                                                            Circle()
                                                                .frame(width: 36, height: 36)
                                                                .foregroundStyle(.indigo)
                                                                .shadow(radius: 1)
                                                        }
                                                    }
                                                    Circle()
                                                        .frame(width: 5, height: 5)
                                                        .foregroundStyle(hasAppts ? .indigo : .clear)
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
                .navigationBarBackButtonHidden(true)
                .padding(.horizontal)
                .onChange(of: vm.selectedMonth) { newValue in
                    vm.selectedDate = vm.fetchSelectedMonth()
                }
            }
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
            .environmentObject(CalenderViewModel())
    }
}
