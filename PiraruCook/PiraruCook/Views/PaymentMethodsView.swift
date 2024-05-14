//
//  PaymentMethodsView.swift
//  PiraruCook
//
//  Created by Breno Harris on 13/05/24.
//

import SwiftUI

struct PaymentMethodsView: View {
    
    var body: some View {
        Section {
            ScrollView(.horizontal) {
                HStack {
                    CardPaymentMethodView(symbol: "plus", description: ["Cadastrar", "Novo cartão"])
                        .padding()
                    
                    CardPaymentMethodView(symbol: "creditcard", description: ["Pagamento", "Cartão crédito"])
                        .padding()
                    CardPaymentMethodView(symbol: "apple.logo", description: ["Pagamento", "Apple Pay"])
                        .padding()
                    
                }
                
            }
            
        }
        header: {
            
            HStack {
                Text("Formas de pagamento")
                    .padding(.horizontal)
                    .font(.title3)
                    .foregroundStyle(.primary)
                Spacer()
            }
        }
    }
}

#Preview {
    PaymentMethodsView()
}
