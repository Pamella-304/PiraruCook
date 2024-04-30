//
//  DishCart.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 30/04/24.
//

import Foundation

class DishCart: Hashable {
    
    let dish: TypeDish
    var quantity: Int
    
    init(dish: TypeDish, quantity: Int) {
        self.dish = dish
        self.quantity = quantity
    }
    
    static func == (lhs: DishCart, rhs: DishCart) -> Bool {
        lhs.dish == rhs.dish && lhs.quantity == rhs.quantity
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(dish)
        hasher.combine(quantity)
    }
}
