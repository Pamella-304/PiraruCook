//
//  CardItemView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 30/04/24.
//

import SwiftUI

struct CartItemView: View {
    
    @Environment(CartViewModel.self) private var viewModel
    @Environment(\.colorScheme) var colorScheme
    @State var dish: TypeDish
    let imageWidth:CGFloat? = 102
    let imageHeight:CGFloat? = 102

    
    var body: some View {
        VStack {
            
            HStack(spacing:-12) {
                Image(dish.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth, height: imageHeight)
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
                    .foregroundStyle(.brandSenary)
                    .overlay {
                       VStack {
                            HStack {
                                Text(dish.name)
                                    .font(.title2)
                                    .bold()
                                
                                Spacer()
                                
                                
                                Text(totalPrice())
                                    .font(.body)
                                    .bold()
                            }
                            
                            Spacer()
                            
                            HStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.quaternary)
                                    .overlay{
                                        Text("\(viewModel.getQuantity(item: dish))")
                                    }
                                
                                
                                Spacer()
                                
                                Stepper("") {
                                    incrementQuantity()
                                } onDecrement: {
                                    decrementQuantity()
                                }
                                Spacer()
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.quaternary)
                                    .overlay{
                                        Image(systemName: "pencil")
                                    }
                                
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(20)
                        .foregroundStyle(colorScheme == .light ? .black : .white)
                    }
            }
            
            Text(dish.comment)
                .background()
                .padding(EdgeInsets(top: 8, leading: 102, bottom: 0, trailing: 0))
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
    
}

extension CartItemView {
    
    func totalPrice() -> String {
        
        let value = Double(viewModel.getQuantity(item: dish)) * dish.price
        return "R$ " + value.formatted(.number.precision(.fractionLength(2)))
        
    }
    
    func incrementQuantity() {
        viewModel.addItem(item: dish)
    }
    
    func decrementQuantity() {
        if viewModel.getQuantity(item: dish) > 0 {
            viewModel.removeItem(item: dish)
        }
    }
}

