//
//  CartPaymentView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 12/05/24.
//

import SwiftUI

struct CartPaymentResumeView: View {
    
    @Environment(CartViewModel.self) private var cart
    @State var isDelivery = false
    
    var body: some View {
        VStack(spacing:16) {
            HStack {
                Text("Subtotal")
                Spacer()
                Text(cart.getSubTotalValue())
            }
            
            VStack {
                HStack {
                    Text("Entrega")
                    Spacer()
                    Picker(selection: $isDelivery, label: Text("Opção de entrega")) {
                        Text("Entrega").tag(true)
                        Text("Retirar no local").tag(false)
                    }
                    .onChange(of: isDelivery) { oldValue, newValue in
                        cart.setTransportation(cost: newValue ? 5.0 : 0.0)
                        cart.isDelivery = newValue
                    }
                }
                
                Text(cart.getTransportation())
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            
            HStack {
                Text("Total")
                Spacer()
                Text(cart.getTotalValue())
                
            }
        }
        .padding(.horizontal)
    }
}
