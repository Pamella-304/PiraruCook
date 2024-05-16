//
//  TabBarView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var stackPathMenu = Router()
    @State private var stackPathCart = Router()
    @State private var stackPathProfile = Router()
    @State private var selection = 3
    @Environment(User.self) var user: User?
    
    var body: some View {
        
        TabView(selection:$selection) {
            
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
            .tag(1)
            
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
                            PaymentView()
                        case .PaymentDone:
                            PaymentDoneView()
                        default:
                            MenuView()

                        }
                    }
            }
            .environment(stackPathCart)
            .tabItem {
                Label("Carrinho", systemImage: "cart.fill")
            }
            .tag(2)
            
            
            
            NavigationStack(path: $stackPathProfile.path) {
                LoginProfileView()
                    .environment(user)
                    .navigationTitle("Perfil")
                    .navigationDestination(for: RouterData.self) { data in
                        
                        switch data.screen {
                        case Views.SignInForms:
                            SignInFormsView()
                        case Views.PreviousOrders:
                            PreviousOrdersView()
                        case Views.Addresses:
                            EditAddressView()
                        case Views.Configuration:
                            ChangeUserInfoView()
                        case Views.EventInfo:
                            EventDescriptionView()
                        case Views.PaymentMethods:
                            PaymentMethodsView()
                        default:
                            // TODO: verify navigation
                            LoginProfileView()
                                .environment(user)
                        }
                    }

            }
            .environment(stackPathProfile)
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            .tag(3)
        }
        
    }
}
