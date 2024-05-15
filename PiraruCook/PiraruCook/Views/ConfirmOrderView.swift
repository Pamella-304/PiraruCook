//
//  ConfirmOrderView.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 13/05/24.
//

import SwiftUI

struct ConfirmOrderView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(Router.self) private var stackPathPix
    @Environment(CartViewModel.self) private var viewModel
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "mappin")
                Text("R. Silvio da Silva")
                Spacer()
                Text("até 40 min").opacity(0.6)
            }.padding()
            Divider().padding(.horizontal)
            HStack{
                Image(systemName: "mappin")
                Text(viewModel.paymentMethod.rawValue)
                Spacer()
                Text(viewModel.displayTotalValue()).bold()
            }.padding()
            Spacer()
            Button{
                // TODO: ended payment logic
                dismiss()
                stackPathPix.path.append(RouterData(screen: .PaymentDone))
            }label: {
                Text("Confirmar Pedido")
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.blue).bold()
            }
            .cornerRadius(10)
            .padding(16)
          Spacer()
        }.navigationTitle("Confirmar Pedido")
    }
}

#Preview {
    ConfirmOrderView()
}
