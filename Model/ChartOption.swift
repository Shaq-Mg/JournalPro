//
//  Chart.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 14/06/2024.
//

import Foundation

enum ChartOption: CaseIterable {
case last7Days, next7Days
    
    var title: String {
        switch self {
        case .last7Days: return "Previous week"
        case .next7Days: return "Next week"
            
        }
    }
}
