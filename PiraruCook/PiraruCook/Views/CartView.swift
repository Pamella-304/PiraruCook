//
//  CartView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//
import SwiftUI

struct CartView: View {
    
    @Environment(Router.self) private var stackPathCart
    @Environment(Cart.self) private var cart
    @State var viewModel = CartViewModel()
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                Section {
                    if let items = viewModel.cart?.items {
                        if !items.isEmpty {
                            ForEach(items) { item in
                                CartItemView(dish: item)
                            }
                        }
                    }
                }
            }
            
            VStack {
                HStack {
                    Text("Subtotal:")
                    Spacer()
                    Text(String(format: "%.2f", viewModel.cart?.subTotalValue ?? 0))
                }
                HStack {
                    Text("Transportation:")
                    Spacer()
                    Text(String(format: "%.2f", viewModel.cart?.transportationValue ?? 0))
                }
                HStack {
                    Text("Total:")
                    Spacer()
                    Text(String(format: "%.2f", viewModel.cart?.getTotalValue() ?? 0))
                }
            }
            .padding(.horizontal)
            
            // MARK: Payment
            Button{
                // TODO: payment logic
                stackPathCart.path.append(RouterMenuData(screen: .Payment))
            }label: {
                Text("Pagamento")
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
            }
            .cornerRadius(10)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            
            
        }
        .navigationTitle("Cart")
        .onAppear {
            self.viewModel.setup(self.cart)
        }
    }
}

#Preview {
    CartView()
        .environment(Cart())
}
