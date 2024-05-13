//
//  ConfirmOrderView.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 13/05/24.
//

import SwiftUI

struct ConfirmOrderView: View {
    @Environment(\.dismiss) var dismiss
    
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
                Text("Pix")
                Spacer()
                Text("R$ \((20).formatted(.number.precision(.fractionLength(2))))").bold()
            }.padding()
            Spacer()
            Button{
                // TODO: ended payment logic
                dismiss()
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
