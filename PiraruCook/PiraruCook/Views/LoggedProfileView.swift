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
    @State private var user: User?
    
    
    
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
                        .frame(width: 32, height: 32)
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
        .onAppear {
            loadUserData()
        }
        .onChange(of: isLoggedIn) { _ in
                    loadUserData()
        }
        

        Spacer()
    }
    
    func loadUserData() {
            if let userID = UserDefaults.standard.dictionaryRepresentation().keys.first(where: { $0.hasPrefix("user_ ") }) {
                if let userData = UserDefaults.standard.data(forKey: userID) {
                    do {
                        // Decodifica os dados do usuário
                        let user = try JSONDecoder().decode(User.self, from: userData)
                        self.user = user // Define o usuário recuperado na variável de estado
                    } catch {
                        print("Erro ao decodificar usuário:", error)
                    }
                }
            }
        }
    
}

#Preview {
    LoggedProfileView(isLoggedIn: .constant(true))
        .environment(Router())
}
