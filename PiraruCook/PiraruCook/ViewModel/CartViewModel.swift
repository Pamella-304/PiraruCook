//
//  Cart.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import Foundation

@Observable
class CartViewModel {
    
    var items: [DishCart]
    var subTotalValue: Double
    var transportationValue: Double
    var isDelivery = false
    var services = CartService()
    
    init(items: [DishCart] = [], subTotalValue: Double = 0, transportationValue: Double = 0) {
        self.items = items
        self.subTotalValue = subTotalValue
        self.transportationValue = transportationValue
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
    
    func cleanItems() {
        items = []
    }
    
    func getQuantity(item: TypeDish) -> Int {
       services.getQuantity(item: item, items: items)
    }
    
    func getItems() -> [DishCart] {
        items
    }
    
    func getSubTotalValue() -> String {
        
        let text = String((subTotalValue).formatted(.number.precision(.fractionLength(2))))
        return "R$ " + text
        
    }
    
    func getTotalValue() -> String {
        
        let text = String((subTotalValue + transportationValue).formatted(.number.precision(.fractionLength(2))))
        return "R$ " + text
        
    }
    
    func getTransportation() -> String {
        
        let text = String((transportationValue).formatted(.number.precision(.fractionLength(2))))
        return "R$ " + text
        
    }
    
}
