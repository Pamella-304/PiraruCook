//
//  Cart.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import Foundation

@Observable
class Cart {
    
    var items: [DishCart]
    var subTotalValue: Double
    var transportationValue: Double
    var services = CartService()
    
    init(items: [DishCart] = [], subTotalValue: Double = 0, transportationValue: Double = 0) {
        self.items = items
        self.subTotalValue = subTotalValue
        self.transportationValue = transportationValue
    }
    
    func getTotalValue() -> Double {
        subTotalValue + transportationValue
    }
    
    func setTransportation(cost: Double) {
        transportationValue = cost
    }
    
    func addItem(item: TypeDish) {
        items = services.addItem(item: item, items: items)
        subTotalValue += item.price
    }
    
    func removeItem(item: TypeDish) {
        (items, subTotalValue) = services.removeItem(item: item, items: items, value: subTotalValue)
    }
    
}
