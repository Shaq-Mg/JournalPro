//
//  CalenderViewModel.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 09/06/2024.
//

import Foundation

class CalenderViewModel: ObservableObject {
    @Published var selectedMonth = 0
    @Published var showConfirmedAppt = false
    @Published var currentDate: Date?
    @Published var selectedDate = Date()
    @Published var times = [Date(),
                              Calendar.current.date(byAdding: .hour, value: 1, to: Date())!, Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
                              Calendar.current.date(byAdding: .hour, value: 3, to: Date())!, Calendar.current.date(byAdding: .hour, value: 4, to: Date())!]
    let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
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
