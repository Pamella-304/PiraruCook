//
//  Cart.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import Foundation

enum PaymentMethods: String {
    case Pix
    case CreditCard
    case ApplePay
    case Dinheiro
}

class Cupom {
    let discountIsFixed: Bool
    let discountValue: Double
    
    init(discountIsFixed: Bool, discountValue: Double) {
        self.discountIsFixed = discountIsFixed
        self.discountValue = discountValue
    }
}

@Observable
class CartViewModel {
    
    var items: [DishCart]
    var subTotalValue: Double
    var transportationValue: Double
    var paymentMethod: PaymentMethods
    var change: Double
    var isDelivery = false
    var cupom: Cupom?
    var services = CartService()
    
    init(items: [DishCart] = [], subTotalValue: Double = 0, transportationValue: Double = 0, paymentMethod: PaymentMethods = .Pix, change: Double = 0, cupom: Cupom? = nil) {
        self.items = items
        self.subTotalValue = subTotalValue
        self.transportationValue = transportationValue
        self.paymentMethod = paymentMethod
        self.change = change
        self.cupom = cupom
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
    
    func getTotalValue() -> Double {
        services.getTotalValue(subTotalValue: subTotalValue, transportationValue: transportationValue, cupom: cupom)
    }
    
    func getDiscount() -> Double {
        subTotalValue + transportationValue - getTotalValue()
        
    }
    
    func displaySubTotalValue() -> String {
        
        let text = String((subTotalValue).formatted(.number.precision(.fractionLength(2))))
        return "R$ " + text
        
    }
    
    func displayTransportation() -> String {
        
        let text = String((transportationValue).formatted(.number.precision(.fractionLength(2))))
        return "R$ " + text
        
    }
    
    func displayTotalValue() -> String {
        
        let text = String((getTotalValue()).formatted(.number.precision(.fractionLength(2))))
        return "R$ " + text
        
    }
    func PixOption(){
        paymentMethod = PaymentMethods.Pix
    }
    func MoneyOption(){
        paymentMethod = PaymentMethods.Dinheiro
    }
    func CreditCardOption(){
        paymentMethod = PaymentMethods.CreditCard
    }
    func ApplePayOption(){
        paymentMethod = PaymentMethods.ApplePay
    }
    
    
    
}
