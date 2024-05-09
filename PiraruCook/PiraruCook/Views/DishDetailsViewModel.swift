//
//  DishDetailsViewModel.swift
//  PiraruCook
//
//  Created by Breno Harris on 30/04/24.
//

import Foundation

@Observable
class ItemDetailsViewModel: Setup {
    
    var cart: Cart?
    var dish: TypeDish
    
    var showIngredients: Bool = false
    var showNutritionalInfo: Bool = false
    var comment: String = ""
    
    var reviews: [Review] = []
    let exampleReviews = [Review(name: "Maria", description: "Achei o prato bem gostoso, pediria outras vezes com prazer."), Review(name: "Carlos", description: "Muito bom"), Review(name: "Andrea", description: "Optaria por outra opção do cardápio.")]
    
    let exampleSugestedDishes = [TypeDish(name: "Capirinha", description: "Bom", image: "Caipirinha", nutritionalInfo: ["Arroz"], ingredients: ["Álcool"], price: 20.25, tipo: "Bebidas", comment: "Sem gelo")]
    
    init(dish: TypeDish) {
        self.dish = dish
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
            ""
        case "Doce":
            "Você selecionou a Opção 2"
        case "Salgado":
            "Você selecionou a Opção 3"
        default:
            "Opção inválida"
        }
    }
    
    func updateCommnet() {
        dish.updateComment(comment)
    }
    
    func addToCart() {
        cart?.addItem(item: dish)
    }
}

struct Review: Hashable {
    var name: String
    var description: String
    
}

