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
                
                
                ProfileOptionsView(imageName: "creditcard.fill", title:
                                "Pagamentos", description: "Preferências de transferência")
                
                NavigationLink(value: RouterData(screen: Views.Addresses)) {
                    ProfileOptionsView(imageName: "mappin", title:
                                    "Endereços", description: "Preferências de endereço de entrega")
                }
                .foregroundStyle(.primary)
                
                
                NavigationLink(value: RouterData(screen: Views.PreviousOrders)) {
                                        
                    ProfileOptionsView(imageName: "book.pages.fill", title: "Histórico", description: "Histórico de pedidos")
                }
                .foregroundStyle(.primary)
                
                
                
                ProfileOptionsView(imageName: "party.popper.fill", title:
                                "Festival de Paratins", description: "Acesse as informações do evento atual")

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
        
}

#Preview {
    LoggedProfileView(isLoggedIn: .constant(true))
        .environment(Router())
}
