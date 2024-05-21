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
                
                let subItems = viewModel.dishesList.filteredTypeDishes.filter({ (typeDish) -> Bool in
                    typeDish.tipo == category
                })
                
                if !subItems.isEmpty {
                    
                    Section {
                        ForEach(subItems, id: \.self) { typeDish in
                            
                            Button {
                                viewModel.isPresented = true
                                viewModel.choosenDish = typeDish
                            } label: {
                                ItemCardView(dish: typeDish)
                            }
                            
//                            NavigationLink(value: RouterData(screen: Views.DishDetails, dish: typeDish)) {
//                                // TODO: Chango for card
//                                
//                            }
                        }
                    } header: {
                        Text("\(category)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .id(category)
                    
                }
                
            }
            .sheet(isPresented: $viewModel.isPresented) {
                ItemDetailsView(dish: viewModel.choosenDish!)
            }
        }
        .searchable(text: $viewModel.dishesList.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Buscar Prato")
        .ignoresSafeArea()
        .padding()
    }
        

}
#Preview {
    MenuView()
}
