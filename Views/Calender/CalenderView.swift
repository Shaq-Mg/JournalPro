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
                        ZStack {
                            if value.day != -1 {
                                Text("\(value.day)")
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
