//
//  CartView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//
import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: CartViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.cart.itens, id: \.id) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(String(format: "%.2f", item.price))
                    }
                }
                HStack {
                    Text("Subtotal:")
                    Spacer()
                    Text(String(format: "%.2f", viewModel.cart.subTotalValue))
                }
                HStack {
                    Text("Transportation:")
                    Spacer()
                    Text(String(format: "%.2f", viewModel.cart.transportationValue))
                }
                HStack {
                    Text("Total:")
                    Spacer()
                    Text(String(format: "%.2f", viewModel.cart.totalValue))
                }
            }
            .navigationTitle("Cart")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}
