//
//  CartPaymentView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 12/05/24.
//

import SwiftUI

struct CartPaymentResumeView: View {
    
    @Binding var viewModel: CartViewModel
    
    var body: some View {
        VStack(spacing:16) {
            HStack {
                Text("Subtotal")
                Spacer()
                Text("R$\((viewModel.cart?.subTotalValue ?? 0).formatted(.number.precision(.fractionLength(2))))")
            }
            
            VStack {
                HStack {
                    Text("Entrega")
                    Spacer()
                    Picker(selection: $viewModel.isDelivery, label: Text("Opção de entrega")) {
                        Text("Entrega").tag(true)
                        Text("Retirar no local").tag(false)
                    }
                    .onChange(of: viewModel.isDelivery) { oldValue, newValue in
                        viewModel.cart?.setTransportation(cost: newValue ? 5.0 : 0.0)
                    }
                }
                
                Text("R$\((viewModel.cart?.transportationValue ?? 0).formatted(.number.precision(.fractionLength(2))))")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            HStack {
                Text("Total")
                Spacer()
                Text("R$\((viewModel.cart?.getTotalValue() ?? 0).formatted(.number.precision(.fractionLength(2))))")
            }
        }
        .padding(.horizontal)
    }
}
