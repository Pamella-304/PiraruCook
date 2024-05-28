//
//  DishDetailsViewModel.swift
//  PiraruCook
//
//  Created by Breno Harris on 30/04/24.
//

import Foundation

@Observable
class ItemDetailsViewModel {
    
    var dish: TypeDish
    var quantityOfDish: Int = 1
    var showIngredients: Bool = false
    var showNutritionalInfo: Bool = false
    var comment: String = ""
    
    var reviews: [Review] = []
    let exampleReviews = [Review(name: "Maria", description: "Achei o prato bem gostoso, pediria outras vezes com prazer."), Review(name: "Carlos", description: "Muito bom"), Review(name: "Andrea", description: "Optaria por outra opção do cardápio.")]
    
    let exampleSugestedDishes = [TypeDish(name: "Capirinha", description: "Bom", image: "Caipirinha", nutritionalInfo: ["Arroz"], ingredients: ["Álcool"], price: 20.25, tipo: "Bebidas", comment: "Sem gelo", boi: false)]
    
    init(dish: TypeDish) {
        self.dish = dish
    }
    
    func getQuantityOfDIsh() -> Int {
        return quantityOfDish
    }
    
    func displayName() -> String {
        return dish.name
    }
    
    func displayImage() -> String{
        return dish.image
    }
    
    func displayNutritionalInfo() -> [String] {
        return dish.nutritionalInfo
    }
    
    func displayDescription() -> String{
        return dish.description
    }
    
    func displayIngredients() -> [String] {
        return dish.ingredients
    }
    func displayPrice() -> String {
        return dish.price.formatted(.number.precision(.fractionLength(2)))
    }
    func displayAllergies() -> String{
        switch dish.tipo {
        case "Bebidas":
            "Pode conter: (Alergias na produção de bebidas)"
        case "Doces":
            "Pode conter: (Alergias na produção de doces)"
        case "Salgado":
            "Pode conter: (Alergias na produção de salgados)"
        default:
            "Pode conter: (Alergias na produção de )"
        }
    }
    
    func updateCommnet() {
        dish.updateComment(comment)
    }
    
    func increseQuantityOfDish() {
        quantityOfDish += 1
    }
    func decreaseQuantityOfDish() {
        if quantityOfDish > 1 {
            quantityOfDish -= 1
        }
    }
    
}

struct Review: Hashable {
    var name: String
    var description: String
    
}

