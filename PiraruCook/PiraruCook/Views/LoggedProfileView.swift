//
//  LoggedProfileView.swift
//  PiraruCook
//
//  Created by Breno Harris on 07/05/24.
//

import Foundation
import SwiftUI

struct LoggedInView: View {
    
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
                
                
            }
            Spacer()
        }
        .navigationTitle("Perfil")
    }
}

#Preview {
    LoggedInView()
}
