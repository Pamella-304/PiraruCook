//
//  PaymentMethodsView.swift
//  PiraruCook
//
//  Created by Breno Harris on 13/05/24.
//

import SwiftUI

struct PaymentMethodsView: View {
    
    var body: some View {
        VStack {
            Section {
                ScrollView(.horizontal) {
                    HStack {
                        CardPaymentMethodView(symbol: "plus", description: ["Cadastrar", "Novo cartão"])
                            .padding(4)
                        
                        CardPaymentMethodView(symbol: "creditcard", description: ["Pagamento", "Cartão crédito"])
                            .padding(4)
                        CardPaymentMethodView(symbol: "apple.logo", description: ["Pagamento", "Apple Pay"])
                            .padding(4)
                    }
                    
                    
                }
                Divider()
                
            }
        header: {
            
            HStack {
                Text("Formas de pagamento")
                    .padding(.horizontal)
                    .font(.title3)
                    .foregroundStyle(.primary)
                Spacer()
                }
            .padding()
            }
            Section {
                NavigationLink(value: RouterData(screen: Views.PreviousOrders)) {
                                        
                    ProfileOptionsView(imageName: "book.pages.fill", title: "Histórico", description: "Histórico de Pagamentos")
                }
                .foregroundStyle(.primary)
            } header: {
                HStack {
                    Text("Demais serviços")
                        .padding(.horizontal)
                        .font(.title3)
                        .foregroundStyle(.primary)
                    Spacer()
                    }
                .padding()
            }
            Spacer()
        }
        .navigationTitle("Área de Pagamento")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PaymentMethodsView()
}
