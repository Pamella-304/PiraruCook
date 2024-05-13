//
//  PaymentSections.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 13/05/24.
//

import SwiftUI

struct PaymentSections: View {
    var img1: String
    var subtext: String
    var text: String
    
    
    var body: some View {
        HStack {
            Image(systemName: img1)
            VStack(alignment: .leading) {
                Text(text)
                    .bold()
                // TODO: Retrive number of cupons
                if text == "Pix"{
                    
                } else{
                    Text(subtext)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
            Button {
                //TODO: Levar para cada tela de mudança
            } label: {
                Text("Trocar")
                    .bold()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    PaymentSections(img1: "ticket.fill",subtext: "\(1) cupons disponíveis",text: "Cupom")
}
