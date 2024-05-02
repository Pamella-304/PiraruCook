//
//  CardItemView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 30/04/24.
//

import SwiftUI

struct CartItemView: View {
    
    @Environment(Cart.self) private var cart
    @State var dishCart: DishCart
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(spacing:-12) {
            Image(dishCart.dish.image)
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
                            Text(dishCart.dish.name)
                                .font(.title2)
                                .bold()
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.quaternary)
                                .overlay {
                                    Text("\(dishCart.quantity)")
                                }
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("R$\(totalPrice().formatted(.number.precision(.fractionLength(2))))")
                                .font(.body)
                                .bold()
                            
                            Spacer()
                            
                            Stepper("") {
                                incrementQuantity()
                                print(cart.items)
                            } onDecrement: {
                                decrementQuantity()
                                print(cart.items)
                            }
                            
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .foregroundStyle(colorScheme == .light ? .black : .white)
                    
                }
        }
    }
    
    func totalPrice() -> Double { Double(dishCart.quantity) * self.dishCart.dish.price}
    
    func incrementQuantity() {
        cart.addItem(item: dishCart.dish)
    }
    
    func decrementQuantity() {
        if dishCart.quantity > 0 {
            cart.removeItem(item: dishCart.dish)
        }
    }
    
}

#Preview {
    CartItemView(dishCart: DishCart(dish: TypeDish(name: "Capirinha", description: "Bom", image: "Caipirinha", nutritionalInfo: ["Arroz"], ingredients: ["Álcool"], price: 20.25, tipo: "Bebidas"), quantity: 2))
        .environment(Cart())
}
