//
//  ClientViewModel.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 31/05/2024.
//

import Foundation

final class ClientViewModel: ObservableObject {
    @Published var clients = [Client]()
    @Published var name = ""
    @Published var phoneNumber = ""
    @Published var notes = ""
    @Published var isFavourite = false
}
