//
//  itemCard.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 26/04/24.
//

import SwiftUI

struct itemCardView: View {
    
    //let dish: TypeDish
   
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image("tacaca")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 150)
                            .clipped()
                            .cornerRadius(8)
                        
            Text("tacaca")
                            .font(.headline)
        }
        .padding(8)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
    
}


