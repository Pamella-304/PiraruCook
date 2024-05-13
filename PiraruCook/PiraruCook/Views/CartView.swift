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
            
            // MARK: Cart's items
            CartItemsView(viewModel: $viewModel)
            
            VStack(spacing:16) {
                
                // MARK: Cupom section
                CartCupomView()
                
                
                // MARK: Payment Resume
                CartPaymentResumeView(viewModel: $viewModel)
                
                // MARK: Payment
                CartPaymentButtonView()
                
            }
            
        }
        .navigationTitle("Carrinho")
        .onAppear {
            self.viewModel.setup(self.cart)
        }
    }
}

#Preview {
    CartView()
        .environment(Cart())
}
