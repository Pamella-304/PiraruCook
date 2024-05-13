//
//  EditAddressView.swift
//  PiraruCook
//
//  Created by Breno Harris on 13/05/24.
//

import SwiftUI

struct EditAddressView: View {
    var addressesList: [Address]?
    var body: some View {
        List(exampleAddress, id: \.self) {
            CardAddressView(myAddress: $0)
        }
        .listStyle(.inset)
        .navigationTitle("Endereços")
    }
}


let exampleAddress = [Address(location: "Beco São Francisco 112, Lírio do Vale, Manaus, AM", nickname: "casa", picture: "house"), Address(location: "Avenida Max Teixeira 2078 - Cidade Nova, Manaus, AM", nickname: "trabalho", picture: "suitcase") ]

struct Address: Hashable {
    var location: String
    var nickname: String
    var picture: String
}

#Preview {
    EditAddressView()
}
