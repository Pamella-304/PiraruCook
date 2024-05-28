//
//  DishView.swift
//  PiraruCook
//
//  Created by Breno Harris on 25/04/24.
//

import SwiftUI

struct ItemDetailsView: View {
    
    @Environment(Router.self) private var stackPathMenu
    @Environment(CartViewModel.self) private var cartViewModel
    @Environment(User.self) var user
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @Environment(\.dismiss) var dismiss
    @State private var viewModel: ItemDetailsViewModel
    
    init(dish: TypeDish) {
        self.viewModel = ItemDetailsViewModel(dish: dish)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing:24) {
                if viewModel.dish.name == "Caipirinha" && user.boi != SelectedBoi.none {
                        switch user.boi {
                        case .caprichoso:
                            Image("CaipirinhaCaprichosa")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: width, height: height*0.25)
                                .clipShape(RoundedRectangle(cornerRadius: 0))
                                .overlay {
                                    VStack {
                                        HStack {
                                            Spacer()
                                                    Image("PratoCaprichoso")
                                                        .padding()
                                                
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                    
                                    Button {
                                        dismiss()
                                    } label: {
                                        VStack {
                                            HStack {
                                                ZStack {
                                                    
                                                    Image(systemName: "x.circle")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundStyle(.brandPrimary)
                                                    
                                                    Image(systemName: "x.circle.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundStyle(.brandSenary)
                                                    
                                                    
                                                }
                                                
                                                    
                                                    .frame(width: 45, height: 45)
                                                    .padding(16)
                                                    
                                                Spacer()
                                            }
                                            
                                            Spacer()
                                        }

                                    }
                                                            
                                }
                        case .garantido:
                            Image("CaipirinhaGarantida")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: width, height: height*0.25)
                                .clipShape(RoundedRectangle(cornerRadius: 0))
                                .overlay {
                                    VStack {
                                        HStack {
                                            Spacer()
                                            
                                                    Image("PratoGarantido")
                                                        .padding()
                                                    
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                    
                                    Button {
                                        dismiss()
                                    } label: {
                                        VStack {
                                            HStack {
                                                ZStack {
                                                    
                                                    Image(systemName: "x.circle")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundStyle(.brandPrimary)
                                                    
                                                    Image(systemName: "x.circle.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundStyle(.brandSenary)
                                                    
                                                    
                                                }
                                                
                                                    
                                                    .frame(width: 45, height: 45)
                                                    .padding(16)
                                                    
                                                Spacer()
                                            }
                                            
                                            Spacer()
                                        }

                                    }
                                                            
                                }
                        default:
                            Image(viewModel.displayImage())
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: width, height: height*0.25)
                                .clipShape(RoundedRectangle(cornerRadius: 0))
                                .overlay {
                                    VStack {
                                        HStack {
                                            Spacer()
                                            if ["Salgado", "Doces"].contains(viewModel.dish.tipo) && user.boi != SelectedBoi.none {
                                                
                                                switch user.boi! {
                                                case SelectedBoi.caprichoso:
                                                    Image("PratoCaprichoso")
                                                        .padding()
                                                default:
                                                    Image("PratoGarantido")
                                                        .padding()
                                                    
                                                }
                                               
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                    
                                    Button {
                                        dismiss()
                                    } label: {
                                        VStack {
                                            HStack {
                                                ZStack {
                                                    
                                                    Image(systemName: "x.circle")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundStyle(.brandPrimary)
                                                    
                                                    Image(systemName: "x.circle.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundStyle(.brandSenary)
                                                    
                                                    
                                                }
                                                
                                                    
                                                    .frame(width: 45, height: 45)
                                                    .padding(16)
                                                    
                                                Spacer()
                                            }
                                            
                                            Spacer()
                                        }

                                    }
                                                            
                                }
                        }
                } else {
                    Image(viewModel.displayImage())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: height*0.25)
                        .clipShape(RoundedRectangle(cornerRadius: 0))
                        .overlay {
                            VStack {
                                HStack {
                                    Spacer()
                                    if ["Salgado", "Doces"].contains(viewModel.dish.tipo) && user.boi != SelectedBoi.none {
                                        
                                        switch user.boi! {
                                        case SelectedBoi.caprichoso:
                                            Image("PratoCaprichoso")
                                                .padding()
                                        default:
                                            Image("PratoGarantido")
                                                .padding()
                                            
                                        }
                                       
                                    }
                                }
                                
                                Spacer()
                            }
                            
                            
                            Button {
                                dismiss()
                            } label: {
                                VStack {
                                    HStack {
                                        ZStack {
                                            
                                            Image(systemName: "x.circle")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .foregroundStyle(.brandPrimary)
                                            
                                            Image(systemName: "x.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .foregroundStyle(.brandSenary)
                                            
                                            
                                        }
                                        
                                            
                                            .frame(width: 45, height: 45)
                                            .padding(16)
                                            
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                }

                            }
                                                    
                        }
                }
                // MARK: Image

                


                // MARK: Description
                VStack{
                    HStack{
                        Text(viewModel.displayName())
                            .font(Font(Fonts.title1Font))
                        Spacer()
                        Text("R$ \(viewModel.displayPrice())")
                            .font(Font(Fonts.title2Font))
                    }
                    .foregroundStyle(.brandPrimary)
                    .padding(.horizontal)
                    HStack{
                        Text(viewModel.displayDescription()).font(.title3)
                        Spacer()
                    }.padding(.horizontal)
                }
                
                // MARK: Ingredients
                ChevronDownComponent(displayName:"Ingredientes" ,hasClicked: $viewModel.showIngredients, array: viewModel.displayIngredients())
                    .padding(.horizontal)
                
                
                //MARK: Allergies
                ChevronDownComponent(displayName:"Alergias e restrições" ,hasClicked: $viewModel.showNutritionalInfo, array: [viewModel.displayAllergies()])
                    .padding()
                    

                
                // MARK: Recomendation
//                VStack {
//                    HStack {
//                        Text("Seu prato \(viewModel.dish.name) combina com:")
//                            .font(Font(Fonts.title3Font))
//                        Spacer()
//                    }
//                    ScrollView(.horizontal) {
//                        HStack {
//                            ForEach(viewModel.exampleSugestedDishes, id: \.self) {
//                                ItemCardView(dish: $0)
//                                    .frame(width: 340)
//                            }
//                        }
//                    }
//                }
//                .padding()
                
                
                // MARK: Comment
                
                VStack {
                    Text("Observações")
                        .font(Font(Fonts.title3Font))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Ex: Tirar verduras, sem sal etc.", text: $viewModel.comment, axis: .vertical)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                
                // MARK: Avaliations
//                VStack {
//                    
//                    HStack{
//                        Text("Avaliações").font(.title2)
//                        Spacer()
//                        
//                    }
//                    ScrollView(.horizontal) {
//                        HStack {
//                            ForEach(viewModel.exampleReviews, id: \.self) {
//                                ReviewCard(person: $0.name, reviewText: $0.description)
//                            }
//                            .padding(.horizontal, 4)
//                        }
//                        
//                    }
//                }
//                .padding(.horizontal)
                
                
            }
        }
        .ignoresSafeArea()
        
        // MARK: Buttons
        VStack {
            
            // MARK: Order now
//            Button(action: {
//                // Order Now
//            }) {
//                Text("Order Now")
//                    .foregroundColor(.white)
//                    .padding(16)
//                    .frame(maxWidth: .infinity)
//                    .background(.blue.opacity(0.7))
//            }
//            .cornerRadius(10)
            
            // MARK: Add to cart
            
            // MARK: Set Quantity of item
            
            HStack {
                Text("Quantidade")
                    .font(Font(Fonts.title3Font))
                    .padding(8)
                
                Spacer()
                Text("\(viewModel.quantityOfDish)")
                    .bold()
                    .padding(8)
                    .background(.quaternary)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 5,
                            bottomLeadingRadius: 5,
                            bottomTrailingRadius: 5,
                            topTrailingRadius: 5
                        )
                               
                    )
                
                Stepper("Quantidade") {
                    viewModel.increseQuantityOfDish()
                } onDecrement: {
                    viewModel.decreaseQuantityOfDish()
                }
                .labelsHidden()
                .padding(.horizontal)
            }
            
            
            
            Button {
                viewModel.updateCommnet()
                for _ in 0..<viewModel.quantityOfDish {
                    cartViewModel.addItem(item: viewModel.dish)
                }
                dismiss()
            } label: {
                Text("Adicionar ao carrinho")
                    .font(Font(Fonts.title3Font))
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.brandPrimary)
            }
            .cornerRadius(10)
            
            
        }
        .padding(.horizontal)

    }
}



#Preview {
    ItemDetailsView(dish: TypeDish(name: "Tacaca", description: "Lorem ipsum dolor sit amet", image: "Matrinxa", nutritionalInfo: ["alergia","vegano","gluten-free"], ingredients: ["bacuri","cerveja","Suco","Suco","cerveja"], price: 19.99, tipo: "Bebidas", comment: "Sem sal", boi: false))

        .environment(User())

        .environment(Router())
        .environment(CartViewModel())
}
