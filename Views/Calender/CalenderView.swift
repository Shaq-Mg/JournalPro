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
                CalenderHeaderView()
                
                HStack {
                    ForEach(vm.days, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 20, weight: .semibold))
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
                                        .background(
                                            ZStack(alignment: .bottom) {
                                                if value.date.monthYearFormat() == Date().monthYearFormat() {
                                                    Circle()
                                                        .frame(width: 8, height: 8)
                                                        .foregroundStyle(.indigo)
                                                }
                                            }
                                        )
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
