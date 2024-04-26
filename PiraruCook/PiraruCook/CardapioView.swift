//
//  CardapioView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import SwiftUI

struct CardapioView: View {
    
    @State private var viewModel = CardapioViewModel()
    
    var body: some View {
        Text("a")
    }
}


extension CardapioView {
    
    @Observable
    class CardapioViewModel {
        
        private(set) var itens = TypeDishesListViewModel()
        
    }
    
}
