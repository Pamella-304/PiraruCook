//
//  CartView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//
import SwiftUI

struct CartView: View {
    
    @Environment(Cart.self) private var cart
    @State var viewModel = CartViewModel()
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                Section {
                    if let items = viewModel.cart?.items {
                        if !items.isEmpty {
                            ForEach(items) { item in
                                CartItemView(dishCart: item)
                            }
                        }
                    }
                }
            }
            VStack {
                HStack {
                    Text("Subtotal:")
                    Spacer()
                    Text(String(format: "%.2f", viewModel.cart?.subTotalValue ?? 0))
                }
                HStack {
                    Text("Transportation:")
                    Spacer()
                    Text(String(format: "%.2f", viewModel.cart?.transportationValue ?? 0))
                }
                HStack {
                    Text("Total:")
                    Spacer()
                    Text(String(format: "%.2f", viewModel.cart?.totalValue ?? 0))
                }
            }
        }
        .navigationTitle("Cart")
        .onAppear {
            self.viewModel.setup(self.cart)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
