//
//  ApptChartView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/06/2024.
//

import SwiftUI
import Charts

struct ApptChartView: View {
    let chartData: [Journal] = [
        .init(booking: 10, date: Date.from(year: 2024, month: 1, day: 1)),
        .init(booking: 14, date: Date.from(year: 2024, month: 1, day: 2)),
        .init(booking: 17, date: Date.from(year: 2024, month: 1, day: 3)),
        .init(booking: 11, date: Date.from(year: 2024, month: 1, day: 4)),
        .init(booking: 15, date: Date.from(year: 2024, month: 1, day: 5)),
        .init(booking: 10, date: Date.from(year: 2024, month: 1, day: 6)),
        .init(booking: 0, date: Date.from(year: 2024, month: 1, day: 7))
    ]
    var body: some View {
        VStack {
            Chart {
                RuleMark(y: .value("Goal", 14))
                    .foregroundStyle(.black.opacity(0.2))
                    .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
                
                ForEach(chartData) { value in
                    BarMark(x: .value("Day", value.date, unit: .day),
                            y: .value("Booking", value.booking))
                    .foregroundStyle(.indigo)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .chartXAxis {
                AxisMarks { mark in
                    AxisValueLabel()
                }
            }
            .chartYAxis {
                AxisMarks { mark in
                    AxisValueLabel()
                }
            }
        }
    }
}

struct ApptChartView_Previews: PreviewProvider {
    static var previews: some View {
        ApptChartView()
    }
}
