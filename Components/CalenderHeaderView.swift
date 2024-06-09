//
//  CalenderHeaderView.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 09/06/2024.
//

import SwiftUI

struct CalenderHeaderView: View {
    @EnvironmentObject var vm: CalenderViewModel
    @Binding var selectedDate: Date
    var body: some View {
        HStack {
            Button {
                withAnimation {
                    vm.selectedMonth -= 1
                }
            } label: {
                Image(systemName: "arrow.left")
            }
            
            Spacer()
            HStack {
                Text(selectedDate.monthAndYear())
                Image(systemName: "book")
            }
            .foregroundStyle(.black)
            Spacer()
            
            Button {
                withAnimation {
                    vm.selectedMonth += 1
                }
            } label: {
                Image(systemName: "arrow.right")
            }
        }
        .font(.system(size: 25))
        .foregroundStyle(.indigo)
    }
}

struct CalenderHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderHeaderView(selectedDate: .constant(Date()))
            .environmentObject(CalenderViewModel())
    }
}
