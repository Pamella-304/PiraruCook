//
//  CartItemsView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 13/05/24.
//

import SwiftUI

struct CartItemsView: View {
    
    @Environment(CartViewModel.self) private var cart
    
    var body: some View {
        ScrollView {
            
            Section {
                      
                if !cart.items.isEmpty {
                    ForEach(cart.items) { item in
                        CartItemView(dish: item.dish)
                    }
                }

            }
            
        }
    }
}
