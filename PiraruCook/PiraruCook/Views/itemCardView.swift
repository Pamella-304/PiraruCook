//
//  itemCard.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 26/04/24.
//

import SwiftUI

struct ItemCardView: View {
    
    let dish: TypeDish
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Image(dish.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .clipped()
                .cornerRadius(8)
            
            Divider()
            HStack {
                Text(dish.name)
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Text("R$\(dish.price.formatted(.number.precision(.fractionLength(2))))")
                    .font(.title3)
                    .bold()
            }
            
            HStack {
                Text(dish.ingredients.first ?? "")
                    .frame(alignment: .bottom)
                Spacer()
                Text("Serve até 2 pessoas")
                    .font(.footnote)
            }
            
            
            
        }.padding(8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
    }
    
}


