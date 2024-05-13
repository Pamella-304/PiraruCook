//
//  CartItemsView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 12/05/24.
//

import SwiftUI

struct CartItemsView: View {
    
    @Binding var viewModel: CartViewModel
    
    var body: some View {
        ScrollView {
            
            Section {
                
                Task {
                    do {
                        let items = try viewModel.getItems()
                        
                        if !items.isEmpty {
                            ForEach(items) { item in
                                CartItemView(dish: item)
                            }
                        }
                    } catch {
                        print("error")
                    }
                }
                
                
                
                
                
                
                
                
            }
        }
    }
}
