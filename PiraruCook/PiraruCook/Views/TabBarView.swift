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
    @State private var selection = 4
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        
        TabView(selection:$selection) {
            
            NavigationStack(path: $stackPathMenu.path) {
                MenuView()
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
                Label("Cardápio", systemImage: "list.bullet")
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
                
                Group {
                    if isLoggedIn {
                        LoggedProfileView()
                    } else {
                        LoginProfileView()
                    }
                }
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
                    }
                }
                
            }
            .environment(stackPathProfile)
            .tabItem {
                Label("Perfil", systemImage: "person.fill")
            }
            .tag(3)
        }.accentColor(.brandPrimary)
         .background(.white.opacity(0.75))
         .shadow(color: .black.opacity(0.3), radius: 0, x: 0, y: -0.33)
      


    }
}


#Preview {
    TabBarView()
}
