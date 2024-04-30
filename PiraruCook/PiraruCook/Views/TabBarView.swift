//
//  TabBarView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject private var stackPathMenu = Router()
    @StateObject private var stackPathHome = Router()
    @StateObject private var stackPathCart = Router()
    @State private var selection = 3
    
    var body: some View {
        
        TabView(selection:$selection) {
            NavigationStack(path: $stackPathHome.path) {
                Text("HOLD")
            }
            .environmentObject(stackPathHome)
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(1)
            
            NavigationStack(path: $stackPathMenu.path) {
                MenuView()
                    .navigationTitle("Cardápio")
                    .navigationDestination(for: RouterMenuData.self) { data in
                        
                        switch data.screen {
                        case Views.Menu:
                            MenuView()
                        case Views.DishDetails:
                            ItemDetailsView(dish: data.dish!)
                        }
                    }
            }
            .environmentObject(stackPathMenu)
            .tabItem {
                Label("Cardápio", systemImage: "book.fill")
            }
            .tag(2)
            
            NavigationStack(path: $stackPathCart.path) {
                CartView()
                    .navigationTitle("Cardápio")
                    .navigationDestination(for: RouterMenuData.self) { data in
                        
                        switch data.screen {
                        case Views.Menu:
                            MenuView()
                        case Views.DishDetails:
                            ItemDetailsView(dish: data.dish!)
                        }
                    }
            }
            .environmentObject(stackPathCart)
            .tabItem {
                Label("Carrinho", systemImage: "cart.fill")
            }
            .tag(3)
        }
        
    }
}

#Preview {
    TabBarView()
}
