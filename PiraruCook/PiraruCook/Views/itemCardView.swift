//
//  itemCard.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 26/04/24.
//

import SwiftUI

struct ItemCardView: View {
    
    let dish: TypeDish
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        if dish.tipo == "Bebidas" {
            drinks
        } else {
            dishes
        }
        
    }
    
}

extension ItemCardView {
    
    var drinks: some View {
        HStack(spacing:-12) {
            Image(dish.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 102,height: 102)
                .clipped()
                .clipShape(
                    .rect(
                        topLeadingRadius: 10,
                        bottomLeadingRadius: 10,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 0
                    )
                )
            
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 102)
                .foregroundStyle(colorScheme == .dark ? .black : .white)
                .overlay {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(dish.name)
                                .font(.title2)
                                .bold()
                            
                            Spacer()
                            
                            Text(dish.ingredients.first ?? "")
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("R$\(dish.price.formatted(.number.precision(.fractionLength(2))))")
                                .font(.body)
                                .bold()
                            
                            Spacer()
                            
                            Text("Serve até 2 pessoas")
                                .font(.footnote)
                                .frame(maxWidth: 70)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .foregroundStyle(colorScheme == .light ? .black : .white)
                    
                }
        }
    }
    
    var dishes: some View {
        
        ZStack {
            Image(dish.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay {
                    VStack {
                        Spacer()
                        ZStack {
                            VStack(spacing: 4) {
                                Rectangle()
                                    .frame(height: 4)
                                    .hidden()
                                
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
                                
                                Rectangle()
                                    .frame(height: 4)
                                    .hidden()
                            }
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                            
                            
                        }
                        .padding(4)
                        .background(Color.white.opacity(1))
                    }
                }
            //
            //        .cornerRadius(20)
        }
        
        
    }
    
}

#Preview {
    ItemCardView(dish: TypeDish(name: "Capirinha", description: "Bom", image: "Caipirinha", nutritionalInfo: ["Arroz"], ingredients: ["Álcool"], price: 20.25, tipo: "Bebidas"))
}
