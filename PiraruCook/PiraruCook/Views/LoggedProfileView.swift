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
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 32, height: 32)
                    
                }
                .padding()
                
                Divider()
                    .padding(.horizontal, 8)
                
                ProfileOptionsView(imageName: "creditcard.fill", title:
                                "Pagamentos", description: "Preferências de transferência")
                
                ProfileOptionsView(imageName: "mappin", title:
                                "Endereços", description: "Preferências de endereço de entrega")
                
                
                ProfileOptionsView(imageName: "book.pages.fill", title:
                                "Histórico", description: "Histórico de pedidos")
                
                ProfileOptionsView(imageName: "party.popper.fill", title:
                                "Festival de Paratins", description: "Acesse as informações do evento atual")
                .onAppear{
                    printAllUserData()
                }

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
        // Obtém todas as chaves do UserDefaults
        let keys = UserDefaults.standard.dictionaryRepresentation().keys
        
        // Itera sobre as chaves
        for key in keys {
            print("key")
            // Verifica se a chave começa com "user_"
            if key.hasPrefix("user_ ") {
                print("key com prefixo user_")
                // Obtém os dados associados à chave
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


