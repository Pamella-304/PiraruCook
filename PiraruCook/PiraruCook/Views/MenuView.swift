//
//  CardapioView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import SwiftUI

struct MenuView: View {
    
    @State private var viewModel = MenuViewModel()
    
  
    
    var body: some View {
            ScrollView {
                
                ForEach(viewModel.categories, id:\.self) { category in
                    
                    
                    if category == viewModel.selectedDishType.description  || viewModel.selectedDishType == .all {
                        var subItems = viewModel.dishesList.filteredTypeDishes.filter({ (typeDish) -> Bool in
                            typeDish.tipo == category
                        }).sorted {
                            switch viewModel.sortOrder {
                            case .alphabetically:
                                $0.name < $1.name
                            case .priceBiggerToLower:
                                $0.price > $1.price
                            case .priceLowerToBigger:
                                $0.price < $1.price
                            }
                        }
                        
                        if !subItems.isEmpty {
                            
                            Section {
                                ForEach(subItems, id: \.self) { typeDish in
                                    
                                    Button {
                                        viewModel.isPresented = true
                                        viewModel.choosenDish = typeDish
                                    } label: {
                                        ItemCardView(dish: typeDish)
                                    }
                                }
                            } header: {
                                Text("\(category)")
                                    .padding(.horizontal, 16)
                                    .foregroundStyle(.brandPrimary)
                                    .font(Font(Fonts.title2Font))
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .id(category)
                            
                        }
                    }
                }
                .sheet(isPresented: $viewModel.isPresented) {
                    ItemDetailsView(dish: viewModel.choosenDish!)
                }
            }
            .navigationBarTitle(Text("Cardápio"), displayMode: .large)
            .searchable(text: $viewModel.dishesList.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Buscar Prato")
            .frame(alignment: .leading)
            .background(Color(red: 249/255, green: 249/255, blue: 249/255))
            .toolbar {
                                Menu {
                                    Picker("Ordenar", selection: $viewModel.sortOrder) {
                                        ForEach(sortDishOrder.allCases, id: \.self) {
                                            Text("Ordenar \($0.description)")
                                        }
                                    }
                                    
                                    Picker("Filtrar", selection: $viewModel.selectedDishType) {
                                        ForEach(allDishTypes.allCases, id: \.self) { type in
                                            Text(type.description)
                                        }
                                    }
                                } label: {
                                    Image(systemName: "list.bullet.circle")
                                }
       
            }
            
        
    }

}
#Preview {
    MenuView()
}
