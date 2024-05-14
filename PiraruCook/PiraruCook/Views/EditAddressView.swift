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
        CardAddressView(myAddress: Address(location: "Av. Alan Turing, 275 - Cidade Universitária, Campinas - SP", nickname: "Usar minha localização", picture: "location.north.circle.fill"))
//            .background(.quinary)
        Divider()
        
        List(exampleAddress, id: \.self) {
            CardAddressView(myAddress: $0, isCurrentAddress: ($0 == exampleAddress.first))
        }
        .listStyle(.inset)
        .navigationTitle("Endereços")
    }
}


let exampleAddress = [Address(location: "Beco São Francisco 112, Lírio do Vale, Manaus, AM", nickname: "Casa", picture: "house"), Address(location: "Avenida Max Teixeira 2078 - Cidade Nova, Manaus, AM", nickname: "Trabalho", picture: "suitcase") ]

struct Address: Hashable {
    var location: String
    var nickname: String
    var picture: String
}

#Preview {
    EditAddressView()
}
