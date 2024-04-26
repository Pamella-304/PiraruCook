//
//  CardapioView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import SwiftUI

let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]


struct CardapioView: View {
    
    @State private var viewModel = CardapioViewModel()
    
    var body: some View {
        List {
            ForEach(alphabet, id:\.self) { letter in
                
                let subItems = viewModel.itens.filteredTypeDishes.filter({ (typeDish) -> Bool in
                    typeDish.name.prefix(1).folding(options: .diacriticInsensitive, locale: .current) == letter
                })
                                
                if !subItems.isEmpty {
                    Section(header: Text(letter).id(letter)) {
                        ForEach(subItems, id: \.self) { typeDish in
                            
                            // TODO: Fix Navigation
                            NavigationLink(value: 1) {
                                Text(typeDish.name)
                            }
                        }
                    }
                    .id(letter)
                }
                
            }
        }
    }
}


extension CardapioView {
    
    @Observable
    class CardapioViewModel {
        
        private(set) var itens = TypeDishesListViewModel()
        private var itemShow: TypeDish = TypeDish.example
        
        func setItemShow(item :TypeDish){
            itemShow = item
        }
        
    }
    
}

#Preview {
    CardapioView()
}
