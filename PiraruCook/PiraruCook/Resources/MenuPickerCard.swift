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
            .font(Font(Fonts.title3Font))
                .padding()
                .foregroundStyle(isSelected ? .white : .brandPrimary)
                .background(isSelected ? .brandPrimary : .white)
                .clipShape(
                    .rect(
                        topLeadingRadius: 5,
                        bottomLeadingRadius: 5,
                        bottomTrailingRadius: 5,
                        topTrailingRadius: 5
                    )
                           
                )
    }
}

#Preview {
    MenuPickerCard(text: "Todos", isSelected: true)
}
