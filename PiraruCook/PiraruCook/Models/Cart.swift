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
    var totalValue: Double
    var subTotalValue: Double
    var transportationValue: Double
    
    init(items: [DishCart] = [], totalValue: Double = 0, subTotalValue: Double = 0, transportationValue: Double = 0) {
        self.items = items
        self.totalValue = totalValue
        self.subTotalValue = subTotalValue
        self.transportationValue = transportationValue
    }
    
    func addItem(item: TypeDish) {
        
        if cartHas(item: item) {
            changeQuantity(item: item, increase: true)
        } else {
            items.append(DishCart(dish: item, quantity: 1))
        }
        subTotalValue += item.price
    }
    
    func removeItem(item: TypeDish) {
        if getQuantity(item: item) > 1{
            changeQuantity(item: item, increase: false)
        } else {
            items.removeAll{ $0 == DishCart(dish: item, quantity: 1)}
        }
        
        if getQuantity(item: item) > 0 {
            subTotalValue -= item.price
        }
    }
    
    func setTransportation(cost: Double) {
        transportationValue = cost
        totalValue = subTotalValue + cost
    }
    
    func cartHas(item: TypeDish) -> Bool {
        let dishes = items.map { $0.dish }
        return dishes.contains(item)
    }
    
    func changeQuantity(item: TypeDish, increase: Bool) {
        for (index, dishCart) in items.enumerated() {
            if dishCart.dish == item {
                
                if increase {
                    items[index].quantity += 1
                } else {
                    items[index].quantity -= 1
                }
                break
            }
        }
    }
    
    func getQuantity(item: TypeDish) -> Int{
        for dishCart in items {
            if dishCart.dish == item {
                return dishCart.quantity
            }
        }
        return 0
    }
    
}

