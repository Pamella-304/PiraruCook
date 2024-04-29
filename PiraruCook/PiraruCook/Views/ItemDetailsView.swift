//
//  DishView.swift
//  PiraruCook
//
//  Created by Breno Harris on 25/04/24.
//

import SwiftUI

struct ItemDetailsView: View {
    var dish: TypeDish
    @State var showIngredients: Bool = false
    @StateObject private var viewModel = DishViewModel()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        ScrollView {
            VStack {
                Image(viewModel.displayImage(dish: dish)).resizable().frame(width: width,height: height*0.25)
                VStack{
                    HStack{
                        Text(viewModel.displayName(dish: dish)).font(.title)
                        Spacer()
                        Text("R$ \(viewModel.displayPrice(dish: dish))")
                    }.padding(.horizontal)
                    HStack{
                        Text(viewModel.displayDescription(dish: dish)).font(.title3)
                        Spacer()
                    }.padding(.horizontal)
                }
                ChevronDownComponent(displayName:"Ingredientes" ,hasClicked: $showIngredients, array: viewModel.displayIngredients(dish: dish))
                    .padding()
                VStack{
                    HStack{
                        Text("Imagens").font(.title2)
                        Spacer()
                    }.padding()
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(viewModel.displayIngredients(dish: dish), id: \.self){ img in
                                Image(img).resizable().frame(width: width*0.3,height: height*0.2)
                                
                            }
                        }
                    }
                    
                }
                
                HStack{
                    Text("Fatos Nutricionais").font(.title2)
                    Spacer()
                    Image(systemName: "chevron.right")
                }.padding()
                HStack{
                    Text("Alergias").font(.title2)
                    Spacer()
                    Image(systemName: "chevron.right")
                }.padding()

                HStack{
                    Text("Avaliações").font(.title2)
                    Spacer()
                    Image(systemName: "chevron.right")
                }.padding()

                
                
               
            }
            
            
        }
        .navigationTitle("\(dish.name)")
        .ignoresSafeArea()
        VStack {
            Button(action: {
                // Order Now
            }) {
                Text("Order Now")
                    .foregroundColor(.white)
                    .frame(width: width*0.8, height: height*0.05).background(.black).opacity(0.7)
            }
            
            .cornerRadius(10)
            Button(action: {
                // Order Now
            }) {
                Text("Add to cart")
                    .foregroundColor(.white)
                    .frame(width: width*0.8, height: height*0.05).background(.black)
            }
            
            .cornerRadius(10)
        }
       
    }
    
    class DishViewModel: ObservableObject {
        
        
        func displayName(dish: TypeDish) -> String {
            return dish.name
        }
        
        func displayImage(dish: TypeDish) -> String{
            return dish.image
        }
        func displayDescription(dish: TypeDish) -> String{
            return dish.description
        }
        
        func displayIngredients(dish: TypeDish) -> [String] {
            return dish.ingredients
        }
        func displayPrice(dish: TypeDish) -> String {
            return dish.price.formatted(.number.precision(.fractionLength(2)))
        }
    }
}



#Preview {
    ItemDetailsView(dish: TypeDish.example)
}
