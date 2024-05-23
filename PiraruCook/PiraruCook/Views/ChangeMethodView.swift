//
//  ChangeMethodView.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 15/05/24.
//

import SwiftUI

struct ChangeMethodView: View {
    @Environment(CartViewModel.self) private var viewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack{
            HStack {
                Text("Escolha o método de pagamento:")
                    .padding(.horizontal)
                    .font(.title3)
                    .foregroundStyle(.primary)
                Spacer()
            }.padding()
            Section {
                ScrollView(.horizontal) {
                    HStack {
                        Button{
                            // TODO: change method label and subtitle
                        }label: {
                            CardPaymentMethodView(symbol: "plus", description: ["Cadastrar", "Novo cartão"])
                                .padding(4)
                        }
                        Button{
                            viewModel.MoneyOption()
                            dismiss()
                        }label: {
                            CardPaymentMethodView(symbol: "dollarsign.circle", description: ["Pagamento", "Dinheiro"])
                                .padding(4)
                        }
                        Button{
                            viewModel.PixOption()
                            dismiss()
                        }label: {
                            CardPaymentMethodView(symbol: "rectangle.checkered", description: ["Pagamento", "Pix"])
                                .padding(4)
                        }
                        Button{
                            viewModel.CreditCardOption()
                            dismiss()
                        }label: {
                            CardPaymentMethodView(symbol: "creditcard", description: ["Pagamento", "Cartão de crédito"])
                                .padding(4)
                        }
                        Button{
                            viewModel.ApplePayOption()
                            dismiss()
                        }label: {
                            CardPaymentMethodView(symbol: "apple.logo", description: ["Pagamento", "Apple Pay"])
                                .padding(4)
                        }
                        Button{
                            viewModel.CashOption()
                            dismiss()
                        }label: {
                            CardPaymentMethodView(symbol: "dollarsign.circle", description: ["Pagamento", "Dinheiro"])
                                .padding(4)
                        }


                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ChangeMethodView()
}
