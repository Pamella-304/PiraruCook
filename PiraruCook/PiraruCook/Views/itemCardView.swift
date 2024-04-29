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
        
        
            
            
            
            VStack( spacing: 8) {
                
                Image(dish.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .clipped()
                
                    .font(.headline)
                
                Text(dish.name)
                    .frame(alignment: .top)
                
                Text("blablabla")
                    .frame(alignment: .bottom)

            }
                
            .padding(8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
    }
       
    
}

