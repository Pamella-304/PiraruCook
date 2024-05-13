//
//  CartCupomView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 12/05/24.
//

import SwiftUI

struct CartCupomView: View {
    var body: some View {
        HStack {
            Image(systemName: "ticket.fill")
            VStack(alignment: .leading) {
                Text("Cupom")
                    .bold()
                // TODO: Retrive number of cupons
                Text("\(1) cupons disponíveis")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Button {
                // TODO: Goto CupomView()
            } label: {
                Text("Ver")
                    .bold()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CartCupomView()
}
