//
//  CartPaymentButtonView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 12/05/24.
//

import SwiftUI

struct CartPaymentButtonView: View {
    
    @Environment(Router.self) private var stackPathCart
    
    var body: some View {
        Button{
            // TODO: payment logic
            stackPathCart.path.append(RouterData(screen: .Payment))
        }label: {
            Text("Finalizar Compra")
                .foregroundColor(.white)
                .font(Font(Fonts.title3Font))
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(.brandPrimary)
        }
        .cornerRadius(10)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
    }
}
