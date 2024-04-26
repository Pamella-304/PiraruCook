//
//  MenuView.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 26/04/24.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject var viewModel = TypeDishesListViewModel()

    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                
                VStack(spacing: 16) {
                    
                    Text("oi")
                    
                    ForEach(viewModel.typeDish) { dish in
                        ItemCardView(dish: dish)
                            .frame(maxWidth: geometry.size.width - 32)
                        
                    }
                    
                }
                .padding()
                
                
                
            }.navigationTitle("Menu")
            
        }
    }
    
}
