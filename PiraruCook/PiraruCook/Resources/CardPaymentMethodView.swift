//
//  CardPaymentMethodView.swift
//  PiraruCook
//
//  Created by Breno Harris on 13/05/24.
//

import SwiftUI

struct CardPaymentMethodView: View {
    var symbol: String
    var description: String
    var actualMethod: Bool
    var body: some View {
        
        HStack(spacing: 16) {
            Group {
                if symbol != "dollarsign.circle" {
                    Image(symbol)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                } else {
                    Image(systemName: symbol)
                        .font(.title)
                        .foregroundStyle(.green)
                }
                
                    
            }
            .frame(width: 52, height: 44, alignment: .center)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            
            Text(description)
                .font(.body)
                .foregroundStyle(.black)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(actualMethod ? .brandPrimary : .clear, lineWidth: 2)
        }

    }
}

#Preview {
    CardPaymentMethodView(symbol: "Matrinxa", description: "Pagamento", actualMethod: true)
}
