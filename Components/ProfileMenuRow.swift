//
//  ProfileMenuRow.swift
//  JournalPro
//
//  Created by Shaquille McGregor on 10/06/2024.
//

import SwiftUI

struct ProfileMenuRow: View {
    let image: String
    let title: String
    let color: Color = .indigo
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: image)
                .foregroundStyle(color)
            Text(title)
        }
        .font(.system(size: 18, weight: .semibold))
    }
}

struct ProfileMenuRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMenuRow(image: "message.fill", title: "Contact us")
    }
}
