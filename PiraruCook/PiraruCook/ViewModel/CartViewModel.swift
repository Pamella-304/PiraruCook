//
//  CartViewModel.swift
//  PiraruCook
//
//  Created by Silvana Rodrigues Alves on 30/04/24.
//

import Foundation
import Combine

class CartViewModel: ObservableObject {
    @Published var cart: Cart
    
    init(cart: Cart = Cart()) {
        self.cart = cart
    }
    
    func addItemToCart(_ item: TypeDish) {
        cart.addItem(item: item)
        updateTotals()
    }
    
    func updateTransportationCost(_ cost: Double) {
        cart.setTransportation(cost: cost)
    }
    
    private func updateTotals() {
        cart.totalValue = cart.subTotalValue + cart.transportationValue
    }
}
