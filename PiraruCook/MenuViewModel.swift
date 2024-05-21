//
//  MenuViewModel.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 29/04/24.
//

import Foundation


@Observable
class MenuViewModel {
    
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

