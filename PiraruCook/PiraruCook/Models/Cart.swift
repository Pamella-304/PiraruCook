//
//  Cart.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import Foundation

@Observable
class Cart {
    
    var itens: [DishCart]
    var totalValue: Double
    var subTotalValue: Double
    var transportationValue: Double
    
    init(itens: [DishCart] = [], totalValue: Double = 0, subTotalValue: Double = 0, transportationValue: Double = 0) {
        self.itens = itens
        self.totalValue = totalValue
        self.subTotalValue = subTotalValue
        self.transportationValue = transportationValue
    }
    
    func addItem(item: TypeDish) {
        
        if cartHas(item: item) {
            changeQuantity(item: item, increase: true)
        } else {
            itens.append(DishCart(dish: item, quantity: 1))
        }
        subTotalValue += item.price
    }
    
    func removeItem(item: TypeDish) {
        if cartHas(item: item) {
            changeQuantity(item: item, increase: false)
        } else {
            itens.removeAll{ $0 == DishCart(dish: item, quantity: 1)}
        }
        subTotalValue -= item.price
    }
    
    func setTransportation(cost: Double) {
        transportationValue = cost
        totalValue = subTotalValue + cost
    }
    
    func cartHas(item: TypeDish) -> Bool {
        let dishes = itens.map { $0.dish }
        return dishes.contains(item)
    }
    
    func changeQuantity(item: TypeDish, increase: Bool) {
        for (index, dishCart) in itens.enumerated() {
            if dishCart.dish == item {
                
                if increase {
                    itens[index].quantity += 1
                } else {
                    itens[index].quantity += 1
                }
                break
            }
        }
    }
    
    
    
}

