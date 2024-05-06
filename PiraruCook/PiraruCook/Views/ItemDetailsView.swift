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
    @State private var viewModel = DishViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack {
                Image(viewModel.displayImage(dish: dish)).resizable().frame(width: width,height: height*0.25)
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
                ChevronDownComponent(displayName:"Ingredientes" ,hasClicked: $viewModel.showIngredients, array: viewModel.displayIngredients(dish: dish))
                    .padding()
                VStack{
//                    HStack{
//                        Text("Imagens").font(.title2)
//                        Spacer()
//                    }.padding()
//                    ScrollView(.horizontal){
//                        HStack{
//                            ForEach(viewModel.displayIngredients(dish: dish), id: \.self){ img in
//                                Image(img).resizable().frame(width: width*0.3,height: height*0.2)
//                                
//                            }
//                        }
//                    }
                    
                }
                
                
                VStack {
                    
                    HStack{
                        Text("Avaliações").font(.title2)
                        Spacer()
                        
                    }.padding()
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.exampleReviews, id: \.self) {
                                ReviewCard(person: $0.name, reviewText: $0.description)
                            }
                            .padding(.horizontal, 4)
                        }
                        
                    }
                    
                }
                

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
                        
                        .padding(.horizontal)
                    }
                }
                .padding()
            }
        }
        .ignoresSafeArea()
        VStack {
            Button(action: {
                // Order Now
            }) {
                Text("Order Now")
                    .foregroundColor(.white)
                    .frame(width: width*0.8, height: height*0.05)
                    .background(.blue.opacity(0.7))       
            }
            .cornerRadius(10)
            Button(action: {
                stackPathMenu.goBack()
                viewModel.cart?.addItem(item: dish)
            }) {
                Text("Add to cart")
                    .foregroundColor(.white)
                    .frame(width: width*0.8, height: height*0.05).background(.blue)
            }
            .cornerRadius(10)
        }
        .onAppear {
            self.viewModel.setup(self.cart)
        }
    }
}



#Preview {
    ItemDetailsView(dish: TypeDish.example)
}
