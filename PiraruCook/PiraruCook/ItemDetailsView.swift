//
//  DishView.swift
//  PiraruCook
//
//  Created by Breno Harris on 25/04/24.
//

import SwiftUI

struct ItemDetailsView: View {
    var dish: TypeDish
    @StateObject private var viewModel = DishViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                //imagem
                //nome do prato, preco
                //
                Text("oi")
                
            }
        }
        .navigationTitle("Dish name")
    }
    
    class DishViewModel: ObservableObject {
        
        
        func displayName(dish: TypeDish) -> String {
            return dish.name
        }
        
        func displayImage(dish: TypeDish) -> String{
            return dish.image
        }
        func displayDescription(dish: TypeDish) {
            
        }
        
        func displayIngredients(dish: TypeDish) -> [String] {
            return dish.ingredients
        }
        func displayPrice(dish: TypeDish) -> String {
            return dish.price.formatted(.number.precision(.fractionLength(2)))
        }
    }
}


//
//#Preview {
//    ItemDetailsView(dish: $TypeDish.example)
//}
