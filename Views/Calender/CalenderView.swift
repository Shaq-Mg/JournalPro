//
//  CalenderView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 07/06/2024.
//

import SwiftUI

struct CalenderView: View {
    let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    @State private var selectedMonth = 0
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button {
                    withAnimation {
                        selectedMonth -= 1
                    }
                } label: {
                    Image(systemName: "arrow.left")
                }
                
                Spacer()
                HStack {
                    Text("June")
                    Image(systemName: "book")
                }
                .foregroundStyle(.black)
                Spacer()
                
                Button {
                    withAnimation {
                        selectedMonth += 1
                    }
                } label: {
                    Image(systemName: "arrow.right")
                }
            }
            .font(.system(size: 25, weight: .semibold))
            .foregroundStyle(.indigo)
            
            HStack {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity)
                }
            }
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                ForEach(fetchDates()) { value in
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
        .padding(.horizontal)
    }
    
    func fetchDates() -> [Calender] {
        let calender = Calendar.current
        let currentMonth = fetchSelectedMonth()
        
        var dates = currentMonth.datesOfMonth().map({ Calender(day: calender.component(.day, from: $0), date: $0) })
        
        let firstDayOfWeek = calender.component(.weekday, from: dates.first?.date ?? Date())
        
        for _ in 0..<firstDayOfWeek - 1 {
            dates.insert(Calender(day: -1, date: Date()), at: 0)
        }
        
        return dates
    }
    
    func fetchSelectedMonth() -> Date {
        let calender = Calendar.current
        
        let month = calender.date(byAdding: .month, value: selectedMonth, to: Date())
        return month!
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
