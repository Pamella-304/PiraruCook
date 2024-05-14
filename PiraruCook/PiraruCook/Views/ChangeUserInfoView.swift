//
//  ChangeUserInfoView.swift
//  PiraruCook
//
//  Created by Breno Harris on 14/05/24.
//

import SwiftUI

struct ChangeUserInfoView: View {
    @State var showingSheet = false
    @State var currentEmail = ""
    @State var newEmail = ""
    @State var currentPassword = ""
    @State var newPassword = ""
    
    var body: some View {
        VStack {
            Section {
                VStack {
                    TextField("Email Atual", text: $currentEmail)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    
                    TextField("Email", text: $newEmail)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                }
                
            } header: {
                HStack {
                    Text("Alterar Email Cadastrado")
                        .padding()
                    Spacer()
                }
                
                
            }
            
            Section {
                VStack {
                    TextField("Senha atual", text: $currentPassword)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    
                    TextField("Nova senha", text: $newPassword)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                }
            } header: {
                HStack {
                    Text("Alterar Senha Cadastrada")
                        .padding()
                    Spacer()
                }
                
            }
            
            Button("Atualizar preferências de conta") {
                // atualizar as informacoes com os text fields
            }
            .padding()
            
            
            Section {
                VStack {
                    Button("Alterar meu Boi selecionado") {
                        showingSheet.toggle()
                    }
                }
            } header: {
                HStack {
                    Text("Opções do Evento")
                        .padding()
                    Spacer()
                }
                
            }
            Spacer()
                .sheet(isPresented: $showingSheet) {
                    ChooseBoiSheet()
                }
        }
        
    }
}

#Preview {
    ChangeUserInfoView()
}
