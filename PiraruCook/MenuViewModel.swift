//
//  MenuViewModel.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 29/04/24.
//

import Foundation

extension MenuView {
    
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
    }
    
}
