//
//  LoggedProfileView.swift
//  PiraruCook
//
//  Created by Breno Harris on 07/05/24.
//

import SwiftUI

struct LoggedProfileView: View {
    
    @Environment(Router.self) private var stackPathProfile
    @Environment(User.self) private var user: User?
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
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
                    
                    //user name nao esta atualizando na primeira run do app
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
                    NavigationLink(value: RouterData(screen: Views.Configuration)) {
                        Image(systemName: "pencil")
                            .resizable()
                            
                            .frame(width: 32, height: 32)
                            
                    }
                    .environment(user)
                    .foregroundStyle(.primary)
                
                    
                }
                .padding()
                
                Divider()
                    .padding(.horizontal, 8)
                
                
                NavigationLink(value: RouterData(screen: Views.PaymentMethods)) {
                    ProfileOptionsView(imageName: "creditcard.fill", title:
                                        "Pagamentos", description: "Preferências de transferência")
                }
                .foregroundStyle(.primary)
                
                
                NavigationLink(value: RouterData(screen: Views.Addresses)) {
                    ProfileOptionsView(imageName: "mappin", title:
                                        "Endereços", description: "Preferências de endereço de entrega")
                }
                .environment(user)
                .foregroundStyle(.primary)
                
                
                NavigationLink(value: RouterData(screen: Views.PreviousOrders)) {
                    
                    ProfileOptionsView(imageName: "book.pages.fill", title: "Histórico", description: "Histórico de pedidos")
                }
                .foregroundStyle(.primary)
                
                
                NavigationLink(value: RouterData(screen: Views.EventInfo)) {
                    ProfileOptionsView(imageName: "party.popper.fill", title:
                                        "Festival de Paratins", description: "Acesse as informações do evento atual")
                }
                .environment(user)
                .foregroundStyle(.primary)
            }
            
            Button("Sair") {
                isLoggedIn = false
                stackPathProfile.goToRoot()
            }
            .padding()
            
        }
        .navigationTitle("Perfil")
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
    
}
