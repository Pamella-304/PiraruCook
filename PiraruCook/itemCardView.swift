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
        
        HStack{
            
            VStack( spacing: 8) {
                
                Text(dish.name)
                    .frame(alignment: .top)
                
                Text(dish.description)
                    .frame(alignment: .bottom)

            }
            
            Image(dish.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(8)
            
                .font(.headline)
            
        }.padding(8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
    }
    
}


