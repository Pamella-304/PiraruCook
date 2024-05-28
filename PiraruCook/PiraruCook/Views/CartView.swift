//
//  CartView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//
import SwiftUI

struct CartView: View {
    
    @Environment(Router.self) private var stackPathCart
    @Environment(CartViewModel.self) private var viewModel
    @State var isDelivery = false

    var body: some View {
        
        VStack {
            
            if viewModel.items.isEmpty {
                VStack {

                    Image("carrinho")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.4)
                        .padding(.bottom, 16)
                    Text("Seu carrinho está vazio")
                        .bold()
                        .foregroundColor(.secondary)

                }
            } else {
                
                // MARK: Cart's items
                CartItemsView()
                    .padding(.horizontal)
                
                VStack(spacing: 16) {
                    HStack {
                        Text("Entrega").fontWeight(.semibold)

                        Spacer()
                        Picker(selection: $isDelivery, label: Text("Opção de entrega")) {
                            Text("Entrega").tag(true)
                            Text("Retirar no local").tag(false)
                        }
                        .onChange(of: isDelivery) { oldValue, newValue in
                            viewModel.setTransportation(cost: newValue ? 5.0 : 0.0)
                            viewModel.isDelivery = newValue
                        }
                    }
                    .padding(.leading, 16)

                    
                    HStack {
                        Text("Subtotal").font(Font(Fonts.title4Font))
                        Spacer()
                        
                            Text(viewModel.displaySubTotalValue()).fontWeight(.semibold)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(.brandSenary)
                            }
                    }
                    .padding()
                    
                    CartPaymentButtonView()
                    
                }
            }
            
//            CartItemsView()
//            
//            VStack(spacing:16) {
//                // MARK: Payment Resume
//                // MARK: Payment
//            }
            
        }
        .navigationTitle("Carrinho")

    }
}

#Preview {
    CartView()
        .environment(Router())
        .environment(CartViewModel(items: [DishCart(dish: TypeDish.example, quantity: 1)]))
}
