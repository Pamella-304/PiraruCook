//
//  TabBarView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var stackPathMenu = Router()
    @State private var stackPathHome = Router()
    @State private var stackPathCart = Router()
    @State private var stackPathProfile = Router()
    @State private var selection = 3
    
    var body: some View {
        
        TabView(selection:$selection) {
            NavigationStack(path: $stackPathHome.path) {
                Text("HOLD")
            }
            .environment(stackPathHome)
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(1)
            
            NavigationStack(path: $stackPathMenu.path) {
                MenuView()
                    .navigationTitle("Cardápio")
                    .navigationDestination(for: RouterData.self) { data in
                        
                        switch data.screen {
                        case Views.Menu:
                            MenuView()
                        case Views.DishDetails:
                            ItemDetailsView(dish: data.dish!)
                        default:
                            // TODO: should never end up here
                            MenuView()
                        }
                    }
            }
            .environment(stackPathMenu)
            .tabItem {
                Label("Cardápio", systemImage: "book.fill")
            }
            .tag(2)
            
            NavigationStack(path: $stackPathCart.path) {
                CartView()
                    .navigationTitle("Cardápio")
                    .navigationDestination(for: RouterData.self) { data in
                        
                        switch data.screen {
                        case Views.Menu:
                            MenuView()
                        case Views.DishDetails:
                            ItemDetailsView(dish: data.dish!)
                        case .Payment:
                            // TODO: Change to PaymentView()
                            PaymentView(subtotal: 10, discount: 3, delivery: 10)
                        }
                    }
            }
            .environment(stackPathCart)
            .tabItem {
                Label("Carrinho", systemImage: "cart.fill")
            }
            .tag(3)
            
            
            
            NavigationStack(path: $stackPathProfile.path) {
                ProfileView()
                    .navigationTitle("Perfil")
            }
            .environment(stackPathProfile)
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            .tag(4)
        }
        
    }
}

#Preview {
    TabBarView()
}
