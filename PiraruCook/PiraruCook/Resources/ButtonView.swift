//
//  ButtonView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 24/05/24.
//

import SwiftUI

enum ButtonType {
    case primary, secundary
}

struct ButtonView: View {
    
    let name: String
    let type: ButtonType
    
    var body: some View {
        Text(name)
            .font(Font(Fonts.title3Font))
            .foregroundStyle(type == .primary ? .white : .brandSecondary)
            .padding(8)
            .frame(maxWidth: .infinity)
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(type == .primary ? .brandPrimary : .brandSenary)
            }
    }
}

#Preview {
    ButtonView(name: "Ação", type: .secundary)
}
