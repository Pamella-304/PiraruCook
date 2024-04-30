//
//  DishDetailsViewModel.swift
//  PiraruCook
//
//  Created by Breno Harris on 30/04/24.
//

import Foundation

extension ItemDetailsView {
    
    @Observable
    class DishViewModel {
        var showIngredients: Bool = false
        var showNutritionalInfo: Bool = false
        
        var reviews: [Review] = []
        var exampleReviews = [Review(name: "Maria", description: "Achei o prato bem gostoso, pediria outras vezes com prazer."), Review(name: "Carlos", description: "Muito bom"), Review(name: "Andrea", description: "Optaria por outra opção do cardápio.")]
        
        var exampleSugestedDishes = [TypeDish(name: "Capirinha", description: "Bom", image: "Caipirinha", nutritionalInfo: ["Arroz"], ingredients: ["Álcool"], price: 20.25, tipo: "Bebidas")]
        
        func displayName(dish: TypeDish) -> String {
            return dish.name
        }
        
        func displayImage(dish: TypeDish) -> String{
            return dish.image
        }
        
        func displayNutritionalInfo(dish: TypeDish) -> [String] {
            return dish.nutritionalInfo
        }
        
        func displayDescription(dish: TypeDish) -> String{
            return dish.description
        }
        
        func displayIngredients(dish: TypeDish) -> [String] {
            return dish.ingredients
        }
        func displayPrice(dish: TypeDish) -> String {
            return dish.price.formatted(.number.precision(.fractionLength(2)))
        }
    }
    
    struct Review: Hashable {
        var name: String
        var description: String
        
    }
}

