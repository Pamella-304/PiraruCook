//
//  DishView.swift
//  PiraruCook
//
//  Created by Breno Harris on 25/04/24.
//

import SwiftUI


struct DishView: View {
    var dish: TypeDish
    @StateObject private var viewModel = DishViewModel()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "globe").resizable().frame(width: width,height: height*0.25)
                VStack{
                    HStack{
                        Text(dish.name).font(.title)
                        Spacer()
                        Text("\(dish.price)")
                    }.padding()
                    HStack{
                        Text(dish.description).font(.title3)
                        Spacer()
                    }.padding()
                    
                }
                VStack{
                    HStack{
                        Text("Ingredients").font(.title2)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }.padding()
                    ForEach(viewModel.displayIngredients(dish: dish), id: \.self) { ingredient in
                        
                         
                        
                    }
                }
                VStack{
                    HStack{
                        Text("Images").font(.title2)
                        Spacer()
                        Image(systemName: "chevron.down")
                    }.padding()
                    ScrollView(.horizontal) { //Roleta de imagens
                        LazyHStack {
                            ForEach(0..<4) { _ in
                                Image(systemName: "globe") // Supondo que o nome da imagem seja "globe"
                                    .resizable()
                                    .frame(width: width*0.4, height: height*0.17) // Defina a largura e altura conforme necessário
                                    .padding(10) // Adicione padding entre as imagens
                            }
                            
                        }
                    }
                }
                
                HStack{
                    Text("Nutritional Facts").font(.title2)
                    Spacer()
                    Image(systemName: "chevron.right")
                }.padding()
                //Allergen Information
                //Rating
                
                Button(action: {
                    // Order Now
                }) {
                        Text("Order Now")
                            .foregroundColor(.white)
                }.frame(width: width*0.8, height: height*0.07).background(.blue)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Dish name")
    }
    private var priceFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2 // Set to 2 for two decimal places
        return formatter
      }
    
    class DishViewModel: ObservableObject {
        
        
        func displayName(dish: TypeDish) -> String {
            return dish.name
        }
        
        func displayImage(dish: TypeDish) {
            
        }
        func displayDescription(dish: TypeDish) {
            
        }
        
        func displayIngredients(dish: TypeDish) -> [String] {
            return dish.ingredients
        }
        func displayPrice(dish: TypeDish) -> Float {
            return dish.price
        }
    }
}



#Preview {
    DishView(dish: TypeDish.example)
}
