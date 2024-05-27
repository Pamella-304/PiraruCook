//
//  ProfileOptionsView.swift
//  PiraruCook
//
//  Created by Breno Harris on 08/05/24.
//

import SwiftUI

struct ProfileOptionsView: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 8) {
            
            Image(systemName: "\(imageName)")
                .font(
                    Font.custom("SF Pro", size: 24)
                        .weight(.medium)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
                .frame(width: 64, alignment: .top)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(title)")
                    .font(Font(Fonts.title3Font))
                Text("\(description)")
                    .font(.footnote)
                    .fontWeight(.light)
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical)
        
    }
}

#Preview {
    ProfileOptionsView(imageName: "creditcard.fill", title:
                        "Pagamentos", description: "Preferências de transferência")
}
