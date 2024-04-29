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
        
        if dish.tipo == "Bebidas" {
            drinks
        } else {
            dishes
        }
        
    }
    
}

extension ItemCardView {
    
    var drinks: some View {
        Text("haha")
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
    ItemCardView(dish: TypeDish(name: "Tacupi", description: "Bom", image: "Tacaca", nutritionalInfo: ["Arroz"], ingredients: ["arros"], price: 20.25, tipo: "Salgado"))
}
