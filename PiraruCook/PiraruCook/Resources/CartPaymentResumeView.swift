//
//  CartPaymentView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 12/05/24.
//

import SwiftUI

struct CartPaymentResumeView: View {
    
    @Environment(CartViewModel.self) private var viewModel
    @State var isDelivery = false
    
    var body: some View {
        VStack(spacing:16) {
            HStack {
                Text("Subtotal").font(Font(Fonts.title4Font))
                Spacer()
                Text(viewModel.displaySubTotalValue()).font(Font(Fonts.title4Font))
            }
            
            VStack {
                HStack {
                    Text("Entrega").font(Font(Fonts.title4Font))
                    Spacer()
                    Picker(selection: $isDelivery, label: Text("Opção de entrega")) {
                        Text("Entrega").tag(true)
                        Text("Retirar no local").tag(false)
                    }
                    .onChange(of: isDelivery) { oldValue, newValue in
                        viewModel.setTransportation(cost: newValue ? 5.0 : 0.0)
                        viewModel.isDelivery = newValue
                    }
                }
                
                Text(viewModel.displayTransportation())
                    .font(Font(Fonts.title4Font))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                
            }
            
            HStack {
                Text("Total").font(Font(Fonts.title4Font))
                Spacer()
                ZStack{
                    Rectangle().foregroundColor(.brandSenary).frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.04).cornerRadius(10)
                    Text(viewModel.displayTotalValue()).font(Font(Fonts.title4Font))
                }
                
            }
        }
        .padding(.horizontal)
    }
}
