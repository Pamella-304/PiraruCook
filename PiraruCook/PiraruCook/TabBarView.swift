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
    
    var body: some View {
        
        TabView {
            NavigationStack(path: $stackPathHome.path) {
                Text("HOLD")
            }
            .environmentObject(stackPathHome)
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            NavigationStack(path: $stackPathMenu.path) {
                CardapioView()
                    .navigationTitle("Cardápio")
                    .navigationDestination(for: RouterMenuData.self) { data in
                        
                        switch data.screen {
                        case Views.Menu:
                            CardapioView()
                        case Views.DishDetails:
                            CardapioView()
                        }
                    }
            }
            .environmentObject(stackPathMenu)
            .tabItem {
                Label("Cardápio", systemImage: "book.fill")
            }
        }
        
    }
}

#Preview {
    TabBarView()
}
