//
//  Steup.swift
//  PiraruCook
//
//  Created by Breno Harris on 02/05/24.
//

protocol Setup {
    var cart: Cart? {get set}
    mutating func setup(_ cart: Cart)
}

extension Setup {
    mutating func setup(_ cart: Cart) {
        self.cart = cart
    }
}
