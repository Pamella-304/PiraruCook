//
//  Cart.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import Foundation

@Observable
class Cart {
    
    var itens: [TypeDish]
    var totalValue: Double
    var subTotalValue: Double
    var transportationValue: Double
    
    init(itens: [TypeDish] = [], totalValue: Double = 0, subTotalValue: Double = 0, transportationValue: Double = 0) {
        self.itens = itens
        self.totalValue = totalValue
        self.subTotalValue = subTotalValue
        self.transportationValue = transportationValue
    }
    
    func addItem(item: TypeDish) {
        itens.append(item)
        subTotalValue += item.price
    }
    
    func setTransportation(cost: Double) {
        transportationValue = cost
        totalValue = subTotalValue + cost
    }
    
}
