//
//  LoggedProfileView.swift
//  PiraruCook
//
//  Created by Breno Harris on 07/05/24.
//

import Foundation
import SwiftUI

struct LoggedProfileView: View {
    
    @Environment(Router.self) private var stackPathProfile
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 70)
                            .foregroundStyle(.secondary)
                        Image(systemName: "person")
                    }
                    
                    Text("Nome usuario")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .padding()
                
                Divider()
                    .padding(.horizontal, 8)
                
//                ForEach(subItems, id: \.self) { typeDish in
//                    NavigationLink(value: RouterData(screen: Views.DishDetails, dish: typeDish)) {
//                        // TODO: Chango for card
//                        ItemCardView(dish: typeDish)
//                    }
//                }
                
                NavigationLink(value: RouterData(screen: Views.PaymentMethods)) {
                    ProfileOptionsView(imageName: "creditcard.fill", title:
                                    "Pagamentos", description: "Preferências de transferência")
                }
                
                
                NavigationLink(value: RouterData(screen: Views.Addresses)) {
                    ProfileOptionsView(imageName: "mappin", title:
                                    "Endereços", description: "Preferências de endereço de entrega")
                }
                .foregroundStyle(.primary)
                
                
                NavigationLink(value: RouterData(screen: Views.PreviousOrders)) {
                                        
                    ProfileOptionsView(imageName: "book.pages.fill", title: "Histórico", description: "Histórico de pedidos")
                }
                .foregroundStyle(.primary)
                
                
                NavigationLink(value: RouterData(screen: Views.EventInfo)) {
                    ProfileOptionsView(imageName: "party.popper.fill", title:
                                    "Festival de Paratins", description: "Acesse as informações do evento atual")
                }
                .foregroundStyle(.primary)
            }

            Button("Sair") {
                isLoggedIn = false
                stackPathProfile.path.removeAll()
                stackPathProfile.goToRoot()
            }
            .padding()
            
        }
        .navigationTitle("Perfil")
        .navigationBarBackButtonHidden(true)
        

        Spacer()
    }
 
    
    func printAllUserData() {

        let keys = UserDefaults.standard.dictionaryRepresentation().keys
        
        for key in keys {
            print("key")
            if key.hasPrefix("user_ ") {
                print("key com prefixo user_")
                if let userData = UserDefaults.standard.data(forKey: key) {
                    print("passou por aqui")
                    
                    do {
                        let user = try JSONDecoder().decode(User.self, from: userData)
                        print("printado: \(user)")
                    } catch {
                        print("Erro ao decodificar usuário:", error)
                    }
                }
            }
        }
    }
    
}

#Preview {
    LoggedProfileView(isLoggedIn: .constant(true))
        .environment(Router())
}
