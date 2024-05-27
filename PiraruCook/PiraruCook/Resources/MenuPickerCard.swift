//
//  MenuPickerCard.swift
//  PiraruCook
//
//  Created by Breno Harris on 23/05/24.
//

import SwiftUI

struct MenuPickerCard: View {
    var text: String
    var isSelected: Bool
    var body: some View {
        
        
        Text(text)
            .font(Font(Fonts.title4Font))
                .padding(8)
                .foregroundStyle(isSelected ? .white : .brandPrimary)
                .background(isSelected ? .brandPrimary : .white)
                .clipShape(
                    .rect(
                        topLeadingRadius: 8,
                        bottomLeadingRadius: 8,
                        bottomTrailingRadius: 8,
                        topTrailingRadius: 8
                    )
                           
                )
    }
}

#Preview {
    MenuPickerCard(text: "Todos", isSelected: true)
}
