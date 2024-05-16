//
//  ChangeUserInfoView.swift
//  PiraruCook
//
//  Created by Breno Harris on 14/05/24.
//

import SwiftUI

@Observable
class ChangeUserInfoViewModel {
    var showingSheet = false
    var currentEmail = ""
    var newEmail = ""
    var currentPassword = ""
    var newPassword = ""
}

struct ChangeUserInfoView: View {
    
    @State var viewModel = ChangeUserInfoViewModel()
    
    var body: some View {
        VStack {
            Section {
                VStack {
                    TextField("Email Atual", text: $viewModel.currentEmail)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    
                    TextField("Email", text: $viewModel.newEmail)
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
                    TextField("Senha atual", text: $viewModel.currentPassword)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    
                    TextField("Nova senha", text: $viewModel.newPassword)
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
                        viewModel.showingSheet.toggle()
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
                .sheet(isPresented: $viewModel.showingSheet) {
                    ChooseBoiSheet()
                }
        }
        
    }
}

#Preview {
    ChangeUserInfoView()
}
