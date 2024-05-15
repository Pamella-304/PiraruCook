//
//  CartError.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 13/05/24.
//

import Foundation

enum CartError: String, Error {
    case unableFetchDishes = "[ERROR] Unable to Fetch Dishes"
    case invalidSubTotal = "[ERROR] Invalid SubTotal Value"
    case invalidTotal = "[ERROR] Invalid Total Value"
    case invalidTransportationValue = "[ERROR] Invalid Transportation Value"
}
