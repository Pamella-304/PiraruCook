//
//  PreviousOrdersView.swift
//  PiraruCook
//
//  Created by Breno Harris on 10/05/24.
//

import SwiftUI

struct PreviousOrdersView: View {
    var PreviousrderList: [PreviousOrder]?
    
    var body: some View {
        List(previousOrderExample, id: \.self) {
            CardPreviousOrderView(previousOrder: $0)
        }
        .listStyle(.inset)
        .navigationTitle("Histórico de Pedidos")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}


struct PreviousOrder: Hashable {
    var items: [String]
    var qtyPerItem: [Int]
    var date: Date
    var address: String
    var price: Float
}

let previousOrderExample: [PreviousOrder] = [PreviousOrder(items: ["Pirarucu de Casaca,", "Suco de frutas, ", "Cunhatã"], qtyPerItem: [1, 2, 1], date: Date.now, address: "Entregue em: Avenida Max Teixeira 2078 - Cidade Nova, Manaus, AM", price: 46.99), PreviousOrder(items: ["Bolinho de piracuí,", "Pastel com camarão...,", "Cachaça de Jambu"], qtyPerItem: [4, 3, 2], date: Date.now, address: "Entregue em: Beco São Francisco 112, Lírio do Vale, Manaus, AM", price: 89.98), PreviousOrder(items: ["Pirarucu de Casaca,", "Suco de frutas,", "Cunhatã"], qtyPerItem: [1, 2, 1], date: Date.now, address: "Retirado no local", price: 69.97)]


#Preview {
    PreviousOrdersView()
}
