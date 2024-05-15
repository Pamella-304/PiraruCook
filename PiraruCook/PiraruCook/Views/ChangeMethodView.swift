//
//  ChangeMethodView.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 15/05/24.
//

import SwiftUI

struct ChangeMethodView: View {

    var body: some View {
        VStack{
            HStack {
                Text("Escolha o método de pagamento")
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
                            
                        }label: {
                            CardPaymentMethodView(symbol: "rectangle.checkered", description: ["Pagamento", "Pix"])
                                .padding(4)
                        }
                        Button{

                        }label: {
                            CardPaymentMethodView(symbol: "creditcard", description: ["Pagamento", "Cartão de crédito"])
                                .padding(4)
                        }
                        Button{
                            
                        }label: {
                            CardPaymentMethodView(symbol: "apple.logo", description: ["Pagamento", "Apple Pay"])
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
