//
//  CartViewModel.swift
//  PiraruCook
//
//  Created by Silvana Rodrigues Alves on 30/04/24.
//

import Foundation
import Combine

@Observable
class CartViewModel: Setup {
    var cart: Cart?
    var isDelivery = false
    
    func getItems() throws -> [DishCart] {
        if let items = cart?.items {
            return items
        } else {
            throw CartError.unableFetchDihes
        }
    }
    
    
    
}

enum CartError: Error {
    case unableFetchDihes
}
