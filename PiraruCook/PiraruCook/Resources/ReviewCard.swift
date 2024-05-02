//
//  ReviewCard.swift
//  PiraruCook
//
//  Created by Breno Harris on 30/04/24.
//

import SwiftUI

struct ReviewCard: View {
    
    var person: String
    var reviewText: String
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .frame(width: 300, height: 100)
            .foregroundStyle(.tertiary)
            .overlay {
                VStack {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.secondary)
                            
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.white)
                        }
                        
                        Text("\(person)")
                            .font(.title3)
                        Spacer()
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("\(reviewText)")
                            .lineLimit(3)
                            .padding(.horizontal)
                        Spacer()
                    }
                   
                }
            }
        }
    
}

#Preview {
    ReviewCard(person: "Maria", reviewText: "Achei o prato bem gostoso, pediria outras vezes com prazer.")
}
