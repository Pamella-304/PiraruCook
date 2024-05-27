//
//  TrackOrderView.swift
//  PiraruCook
//
//  Created by Silvana Rodrigues Alves on 23/05/24.
//

import SwiftUI

struct TrackOrderView: View {
    @Environment(CartViewModel.self) private var cartViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(Router.self) private var stackPathProfile

    
    var body: some View {
        VStack {
            Text("Acompanhar Pedido")
                .font(Font(Fonts.title4Font))
                .bold()
                .padding()
            
            List {
                Section(header: Text("Detalhes do Pedido")) {
                    //                    ForEach(viewModel.getItems(), id: \.self) { item in
                    //                        HStack {
                    //                            Text(item.name)
                    //                            Spacer()
                    //                            Text("R$ \(item.price, specifier: "%.2f")")
                    //                        }
                    //                    }
                }
                .font(Font(Fonts.title5Font))

                
                Section(header: Text("Método de Pagamento")) {
                    //                    Text(viewModel.paymentMethod.rawValue)
                }
                .font(Font(Fonts.title5Font))

                
                Section(header: Text("Entrega/Retirada")) {
                    //                    Text(viewModel.isDelivery ? "Entrega" : "Retirada no Local")
                }
                .font(Font(Fonts.title5Font))

                
                Section(header: Text("Tempo Estimado")) {
                    Text("40 minutos")
                }
                .font(Font(Fonts.title5Font))

            }
            .listStyle(InsetGroupedListStyle())
            
            Button {
                stackPathProfile.goToRoot()
            } label:{
                Text("Voltar para Carrinho")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.brandPrimary)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .font(Font(Fonts.title4Font))

            }
            .navigationTitle("Acompanhar Pedido")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    TrackOrderView()
//        .environment(CartViewModel())
//}
