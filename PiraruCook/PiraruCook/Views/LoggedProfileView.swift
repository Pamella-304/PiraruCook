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
    @Environment(User.self) private var user: User?
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
                    
                    if let presentedUserName = user?.userName {
                        Text(presentedUserName)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                    } else {
                        Text("Nome usuario")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                    }
                    Spacer()
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .padding()
                
                Divider()
                    .padding(.horizontal, 8)
                
                
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
    
}
