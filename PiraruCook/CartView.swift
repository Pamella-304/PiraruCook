//
//  CartView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import SwiftUI

struct CartView: View {
    
    @Environment(Cart.self) private var cart
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CartView()
}
