//
//  DishView.swift
//  PiraruCook
//
//  Created by Breno Harris on 25/04/24.
//

import SwiftUI

struct ItemDetailsView: View {
    
    @Environment(Router.self) private var stackPathMenu
    @Environment(Cart.self) private var cart
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var viewModel: ItemDetailsViewModel
    
    init(dish: TypeDish) {
        self.viewModel = ItemDetailsViewModel(dish: dish)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing:24) {
                
                // MARK: Image
                Image(viewModel.displayImage()).resizable().frame(width: width,height: height*0.25)
                
                // MARK: Description
                VStack{
                    HStack{
                        Text(viewModel.displayName()).font(.title)
                        Spacer()
                        Text("R$ \(viewModel.displayPrice())")
                            .font(.title2)
                    }.padding(.horizontal)
                    HStack{
                        Text(viewModel.displayDescription()).font(.title3)
                        Spacer()
                    }.padding(.horizontal)
                }
                //MARK: Allergies
                VStack{
                    HStack{
                        Text("Alérgicos").font(.title)
                        Spacer()
                    }.padding(.horizontal)
                    HStack{
                        Text(viewModel.displayAllergies()).font(.title3)
                        Spacer()
                    }.padding(.horizontal)
                }
                
                
                
                // MARK: Ingredients
                ChevronDownComponent(displayName:"Ingredientes" ,hasClicked: $viewModel.showIngredients, array: viewModel.displayIngredients())
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
                        Text("Seu prato \(viewModel.dish.name) combina com:")
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
                viewModel.updateCommnet()
                viewModel.addToCart()
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
