//
//  CardItemView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 30/04/24.
//

import SwiftUI

struct CartItemView: View {
    
    @Environment(Cart.self) private var cart
    @Environment(\.colorScheme) var colorScheme
    @State var viewModel: CartItemViewModel
    
    var body: some View {
        HStack(spacing:-12) {
            Image(viewModel.dishCart.dish.image)
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
                            Text(viewModel.dishCart.dish.name)
                                .font(.title2)
                                .bold()
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.quaternary)
                                .overlay {
                                    Text("\(viewModel.dishCart.quantity)")
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
                            } onDecrement: {
                                decrementQuantity()
                            }
                            
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .foregroundStyle(colorScheme == .light ? .black : .white)
                    .onAppear{
                        viewModel.setup(self.cart)
                    }
                }
        }
    }
    
    func totalPrice() -> Double { Double(viewModel.dishCart.quantity) * viewModel.dishCart.dish.price}
    
    func incrementQuantity() {
        cart.addItem(item: viewModel.dishCart.dish)
    }
    
    func decrementQuantity() {
        if viewModel.dishCart.quantity > 0 {
            cart.removeItem(item: viewModel.dishCart.dish)
        }
    }
    
}

@Observable
class CartItemViewModel: Setup {
    var cart: Cart?
    var dishCart: DishCart
    
    init(cart: Cart? = nil, dishCart: DishCart) {
        self.cart = cart
        self.dishCart = dishCart
    }
}

#Preview {
    
    CartItemView(viewModel: CartItemViewModel(dishCart: DishCart(dish: TypeDish(name: "Capirinha", description: "nada", image: "Caipirinha", nutritionalInfo: [], ingredients: [], price: 10.10, tipo: "Bebidas", comment: "Sem gelo"),quantity: 2)))
        .environment(Cart())
}


