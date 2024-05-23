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
        
    var body: some View {
        
        VStack {
            
            // MARK: Cart's items
            CartItemsView()
            
            VStack(spacing:16) {
                
                // MARK: Cupom section
                CartCupomView()
                
                
                // MARK: Payment Resume
                CartPaymentResumeView()
                
                // MARK: Payment
                CartPaymentButtonView()
                
            }
            
        }
        .navigationTitle("Carrinho")
        .toolbar{
            Button{
                viewModel.cleanItems()
            }label:{
               Text("Limpar")
            }
        }

    }
}

#Preview {
    CartView()
}
