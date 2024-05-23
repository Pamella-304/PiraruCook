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
                .font(.largeTitle)
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
                
                Section(header: Text("Método de Pagamento")) {
                    //                    Text(viewModel.paymentMethod.rawValue)
                }
                
                Section(header: Text("Entrega/Retirada")) {
                    //                    Text(viewModel.isDelivery ? "Entrega" : "Retirada no Local")
                }
                
                Section(header: Text("Tempo Estimado")) {
                    Text("40 minutos")
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            Button {
                stackPathProfile.goToRoot()
            } label:{
                Text("Voltar ao Cardápio")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
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
