//
//  MenuViewModel.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 29/04/24.
//

import Foundation



@Observable
class MenuViewModel {
    
    var selectedDishType: allDishTypes = .all
    var sortOrder: sortDishOrder = .alphabetically
    
    
    var dishesList = TypeDishesListViewModel()
    
    var categories: [String] {
        var vetor = [String]()
        
        for dish in dishesList {
            if !vetor.contains(dish.tipo){
                vetor.append(dish.tipo)
            }
        }
        
        return vetor.sorted()
    }
    
    var isPresented = false
    var choosenDish: TypeDish?
    
    
    
}


enum allDishTypes: CaseIterable {
    case all, drinks, sweets, pet, dishes
    
    var description: String {
        switch self  {
        case .all: return "Todos"
        case .drinks: return "Bebidas"
        case .pet: return "PET"
        case .dishes: return "Salgado"
        case .sweets: return "Doces"
        }
    }
}

enum sortDishOrder: CaseIterable {
    case alphabetically, priceBiggerToLower, priceLowerToBigger
    
    var description: String {
        switch self  {
        case .priceBiggerToLower: return "Preço Maior-Menor"
        case .priceLowerToBigger: return "Preço Menor-Maior"
        case .alphabetically: return "Alfabeticamente"
        }
    }
}
