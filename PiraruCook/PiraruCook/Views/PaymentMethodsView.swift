//
//  PaymentMethodsView.swift
//  PiraruCook
//
//  Created by Breno Harris on 13/05/24.
//

import SwiftUI

struct PaymentMethodsView: View {
    
    @State var actualMethod:Int = 1
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 16) {
                
                Button {
                    actualMethod = 1
                } label: {
                    CardPaymentMethodView(symbol: "ApplePay", description: "Apple Pay", actualMethod: actualMethod == 1)
                }
                
                Button {
                    actualMethod = 2
                } label: {
                    CardPaymentMethodView(symbol: "banco", description: "**** **** **** 3294", actualMethod: actualMethod == 2)
                }
                
                Button {
                    actualMethod = 3
                } label: {
                    CardPaymentMethodView(symbol: "Pix", description: "PIX", actualMethod: actualMethod == 3)
                }

                Text("Para facilitar suas compras, defina um método de pagamento padrão. Assim, você poderá finalizar suas compras com apenas alguns cliques!")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding()
            
        }
        .background(.colorBackground)
        .navigationTitle("Área de Pagamento")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PaymentMethodsView()
}
