//
//  EditAddressView.swift
//  PiraruCook
//
//  Created by Breno Harris on 13/05/24.
//

import SwiftUI

struct EditAddressView: View {
    @Environment(User.self) var user
    @State var addingAddress = false
    @State var searchingAddress = ""
    var addressesList: [Address]?
    var body: some View {
        VStack{
            ScrollView{
                CardAddressView(myAddress: Address(location: "Av. Alan Turing, 275 - Cidade Universitária, Campinas - SP", nickname: "Usar minha localização", picture: "location.north.circle.fill")).padding(.bottom, 8)
                ForEach(exampleAddress, id: \.self) {
                    CardAddressView(myAddress: $0, isCurrentAddress: ($0 == exampleAddress.first)).padding(8)
                }
                .listStyle(.inset)
            }
            Spacer()
            Button{
                addingAddress = true
            }label: {
                Text("Adicionar endereço").font(Font(Fonts.title3Font))
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.brandPrimary).bold()
            }
            .cornerRadius(10)
            .padding(16)
        }.navigationTitle("Endereços")
            .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchingAddress, placement: .navigationBarDrawer(displayMode: .always), prompt: "Buscar endereço")
            .sheet(isPresented: $addingAddress){
                AddingNewAddressView()
            }
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
