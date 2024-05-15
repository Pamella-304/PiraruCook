//
//  CartItemsView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 13/05/24.
//

import SwiftUI

struct CartItemsView: View {
    
    @Environment(CartViewModel.self) private var viewModel
    
    var body: some View {
        ScrollView {
            
            Section {
                      
                if !viewModel.items.isEmpty {
                    ForEach(viewModel.items) { item in
                        CartItemView(dish: item.dish)
                    }
                }

            }
            
        }
    }
}
