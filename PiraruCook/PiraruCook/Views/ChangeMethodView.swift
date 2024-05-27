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
    @State var actualMethod: Int = 1

    var body: some View {
        VStack{
            HStack {
                Text("Escolha o método de pagamento:")
                    .padding(.horizontal)
                    .font(Font(Fonts.title4Font))
                    .foregroundStyle(.primary)
                Spacer()
            }.padding()
            Section {
                ScrollView(.horizontal) {
                    HStack {
                        Button{
                            // TODO: change method label and subtitle
                        }label: {
                            CardPaymentMethodView(symbol: "plus", description: "Cadastrar", actualMethod: actualMethod == 1)
                                .padding(4)
                        }
                        Button{
                            viewModel.CashOption()
                            dismiss()
                        }label: {
                            CardPaymentMethodView(symbol: "dollarsign.circle", description: "Pagamento", actualMethod: actualMethod == 2)
                                .padding(4)
                        }
//                        Button{
//                            viewModel.PixOption()
//                            dismiss()
//                        }label: {
//                            CardPaymentMethodView(symbol: "rectangle.checkered", description: ["Pagamento", "Pix"])
//                                .padding(4)
//                        }
//                        Button{
//                            viewModel.CreditCardOption()
//                            dismiss()
//                        }label: {
//                            CardPaymentMethodView(symbol: "creditcard", description: ["Pagamento", "Cartão de crédito"])
//                                .padding(4)
//                        }
//                        Button{
//                            viewModel.ApplePayOption()
//                            dismiss()
//                        }label: {
//                            CardPaymentMethodView(symbol: "apple.logo", description: ["Pagamento", "Apple Pay"])
//                                .padding(4)
//                        }
//                        Button{
//                            viewModel.CashOption()
//                            dismiss()
//                        }label: {
//                            CardPaymentMethodView(symbol: "dollarsign.circle", description: ["Pagamento", "Dinheiro"])
//                                .padding(4)
//                        }


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
