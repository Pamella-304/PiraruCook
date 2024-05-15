//
//  CartService.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 12/05/24.
//

import Foundation

class CartService {
    
    func addItem(item: TypeDish, items: [DishCart]) -> [DishCart] {
        
        var items = items
        
        if cartHas(item: item, items: items) {
            changeQuantity(item: item, items: items, increase: true)
        } else {
            items.append(DishCart(dish: item, quantity: 1))
        }
        
        return items
    }
    
    func removeItem(item: TypeDish, items: [DishCart], value: Double) -> ([DishCart], Double) {
        
        var items = items
        var value = value
        
        if getQuantity(item: item, items: items) > 0 {
            value -= item.price
        }
        
        if getQuantity(item: item, items: items) > 1{
            changeQuantity(item: item, items: items, increase: false)
        } else {
            items.removeAll{ $0 == DishCart(dish: item, quantity: 1)}
        }
        
        return (items, value)
        
        
    }
    
    func cartHas(item: TypeDish, items: [DishCart]) -> Bool {
        let dishes = items.map { $0.dish }
        return dishes.contains(item)
    }
    
    func changeQuantity(item: TypeDish, items: [DishCart], increase: Bool) {
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
    
    func getQuantity(item: TypeDish, items: [DishCart]) -> Int {
        for dishCart in items {
            if dishCart.dish == item {
                return dishCart.quantity
            }
        }
        return 0
    }
}
