//
//  DishView.swift
//  PiraruCook
//
//  Created by Breno Harris on 25/04/24.
//

import SwiftUI

struct ItemDetailsView: View {
    
    @EnvironmentObject var stackPathMenu: Router
    @Environment(Cart.self) private var cart
    var dish: TypeDish
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var viewModel: ItemDetailsViewModel
    
    init(dish: TypeDish) {
        self.dish = dish
        self.viewModel = ItemDetailsViewModel()
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing:24) {
                
                // MARK: Image
                Image(viewModel.displayImage(dish: dish)).resizable().frame(width: width,height: height*0.25)
                
                // MARK: Description
                VStack{
                    HStack{
                        Text(viewModel.displayName(dish: dish)).font(.title)
                        Spacer()
                        Text("R$ \(viewModel.displayPrice(dish: dish))")
                            .font(.title2)
                    }.padding(.horizontal)
                    HStack{
                        Text(viewModel.displayDescription(dish: dish)).font(.title3)
                        Spacer()
                    }.padding(.horizontal)
                }
                
                // MARK: Ingredients
                ChevronDownComponent(displayName:"Ingredientes" ,hasClicked: $viewModel.showIngredients, array: viewModel.displayIngredients(dish: dish))
                    .padding(.horizontal)
                
                // MARK: Comment
                
                VStack {
                    Text("Observações")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Ex: Tirar verduras, sem sal etc.", text: $viewModel.comment, axis: .vertical)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                
                // MARK: Avaliations
                VStack {
                    
                    HStack{
                        Text("Avaliações").font(.title2)
                        Spacer()
                        
                    }
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.exampleReviews, id: \.self) {
                                ReviewCard(person: $0.name, reviewText: $0.description)
                            }
                            .padding(.horizontal, 4)
                        }
                        
                    }
                }
                .padding(.horizontal)
                
                // MARK: Recomendation
                VStack {
                    HStack {
                        Text("Seu prato \(dish.name) combina com:")
                            .font(.title2)
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.exampleSugestedDishes, id: \.self) {
                                ItemCardView(dish: $0)
                                    .frame(width: 340)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .ignoresSafeArea()
        
        // MARK: Buttons
        VStack {
            
            // MARK: Order now
            Button(action: {
                // Order Now
            }) {
                Text("Order Now")
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.blue.opacity(0.7))
            }
            .cornerRadius(10)
            
            // MARK: Add to cart
            Button(action: {
                dish
                viewModel.cart?.addItem(item: dish)
                stackPathMenu.goBack()
            }) {
                Text("Add to cart")
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
            }
            .cornerRadius(10)
        }
        .padding(.horizontal)
        .onAppear {
            self.viewModel.setup(self.cart)
        }
    }
}



#Preview {
    ItemDetailsView(dish: TypeDish.example)
        .environment(Cart())
}
