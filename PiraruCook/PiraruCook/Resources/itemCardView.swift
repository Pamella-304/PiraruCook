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
     
            if dish.tipo == "Salgado" ||  dish.tipo == "Doces"{
                dishes
            } else {
                drinks
            }
        
    }
    
}

extension ItemCardView {
    
    var drinks: some View {
        HStack(spacing:-12) {
            Image(dish.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 102,height: 102)
                .clipped()
                .clipShape(
                    .rect(
                        topLeadingRadius: 10,
                        bottomLeadingRadius: 10,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 10
                    )
                )
            
            RoundedRectangle(cornerRadius: 0)
                .frame(height: 102)
                .foregroundStyle(.brandSenary)
                .clipped()
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 10,
                        topTrailingRadius: 10
                    )
                )
                .overlay {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(dish.name)
                                .font(Font(Fonts.title3Font))
                                .bold()
                            
                            Spacer()
                            
                            Text(dish.ingredients.joined(separator: ", "))
                                .multilineTextAlignment(.trailing)
                                .font(.body)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("R$\(dish.price.formatted(.number.precision(.fractionLength(2))))")
                                .font(Font(Fonts.title3Font))
                                .bold()
                            
                            Spacer()
                            
                            
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .foregroundStyle(colorScheme == .light ? .black : .white)
                    
                }
        }
    }
    
    var dishes: some View {
        ZStack(alignment: .bottom) {
        
            Image(dish.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay {
                    
                    VStack {
                        
                        HStack {
                            Text(dish.name)
                            Spacer()
                            Text("R$\(dish.price.formatted(.number.precision(.fractionLength(2))))")
                        }
                        .font(Font(Fonts.title3Font))
                        .bold()
                        
                        HStack {
                            Text(dish.ingredients.joined(separator: ", "))
                                .multilineTextAlignment(.trailing)
                                .font(.body)
                            Spacer()
                            Text("Serve até 3 pessoas")
                        }
                        
                    }
                    .padding()
                    .foregroundStyle(.black)
                    .frame(width: 350, height: 80)
                    .background(.brandSenary)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 10,
                            bottomTrailingRadius: 10,
                            topTrailingRadius: 0
                        )
                    )
                }
            
            
        }
        .frame(width: 200, height: 200)
        
        
    }
    
}

#Preview {
    ItemCardView(dish: TypeDish(name: "Cubiu", description: "Bom", image: "Cubiu", nutritionalInfo: ["Arroz"], ingredients: ["Álcool"], price: 20.25, tipo: "Salgado", comment: "Sem sal", boi: false))
}

