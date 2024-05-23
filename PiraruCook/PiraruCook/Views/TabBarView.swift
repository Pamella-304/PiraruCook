import SwiftUI

struct TabBarView: View {
    
    @State private var stackPathMenu = Router()
    @State private var stackPathCart = Router()
    @State private var stackPathProfile = Router()
    @State private var selection = 1  // Padrão para a tela de cardápio
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var selectedPaymentMethod: PaymentMethods = .Pix

    var body: some View {
        
        TabView(selection: $selection) {
            
            NavigationStack(path: $stackPathMenu.path) {
                MenuView()
                    .navigationDestination(for: RouterData.self) { data in
                        
                        switch data.screen {
                        case .Menu:
                            MenuView()
                        case .DishDetails:
                            ItemDetailsView(dish: data.dish!)
                        default:
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
                    .navigationTitle("Carrinho")
                    .navigationDestination(for: RouterData.self) { data in
                        
                        switch data.screen {
                        case .Menu:
                            MenuView()
                        case .DishDetails:
                            ItemDetailsView(dish: data.dish!)
                        case .Payment:
                            PaymentView()
                        case .PaymentDone:
                            if let method = data.method {
                                PaymentDoneView(selectedPaymentMethod: method)
                            } else {
                                PaymentDoneView(selectedPaymentMethod: .Pix)
                            }
                        case .TrackOrder:
                            TrackOrderView()
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
                    case .SignInForms:
                        SignInFormsView()
                    case .PreviousOrders:
                        PreviousOrdersView()
                    case .Addresses:
                        EditAddressView()
                    case .Configuration:
                        ChangeUserInfoView()
                    case .EventInfo:
                        EventDescriptionView()
                    case .PaymentMethods:
                        PaymentMethodsView()
                    default:
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
