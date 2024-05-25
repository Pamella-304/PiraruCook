//
//  ChangeUserInfoView.swift
//  PiraruCook
//
//  Created by Breno Harris on 14/05/24.
//

import SwiftUI



struct ChangeUserInfoView: View {
    @Environment(User.self) private var user
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
                        .font(Font(Fonts.title4Font))
                        .foregroundStyle(.brandPrimary)
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
                        .font(Font(Fonts.title4Font))
                        .foregroundStyle(.brandPrimary)
                        .padding()
                    Spacer()
                }
                
            }
            
            Button("Atualizar preferências de conta") {
                if ((viewModel.confirmInformation(written: viewModel.currentEmail, actual: user.email)) && (viewModel.confirmInformation(written: viewModel.currentPassword, actual: user.password))) {
                    
                    UserHelper.updateUser(user: user, newEmail: viewModel.newEmail, newPassword: viewModel.newPassword)
                    viewModel.alertMessage = "Usuario atualizado"
                    viewModel.alertTitle = "Sucesso"
                } else {
                    viewModel.alertTitle = "Erro"
                    viewModel.alertMessage = "Algum dos campos não condiz com o valor encontrado"
                }
                viewModel.showAlert.toggle()
            }
            .foregroundStyle(.brandPrimary)
            .padding()
            
            
            Section {
                VStack {
                    Button("Alterar meu Boi selecionado") {
                        viewModel.showingSheet.toggle()
                    }
                    .foregroundStyle(.brandPrimary)
                }
            } header: {
                HStack {
                    Text("Opções do Evento")
                        .font(Font(Fonts.title4Font))
                        .foregroundStyle(.brandPrimary)
                        .padding()
                    Spacer()
                }
                
            }
            Spacer()
                .sheet(isPresented: $viewModel.showingSheet) {
                    ChooseBoiSheet()
                        .environment(user)
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text(viewModel.alertTitle),
                          message: Text(viewModel.alertMessage),
                          dismissButton: .default(Text("OK")))
                }
        }
        
    }
}

@Observable
class ChangeUserInfoViewModel {
    var showAlert = false
    var alertTitle = ""
    var alertMessage = ""
    var showingSheet = false
    var currentEmail = ""
    var actualCurrentEmail: String?
    var newEmail = ""
    var currentPassword = ""
    var actualCurrentPassword: String?
    var newPassword = ""
    
    
    func confirmInformation(written: String, actual: String?) -> Bool {
        
        if actual == nil {
            return false
        }
        return written == actual!
    }
}


#Preview {
    ChangeUserInfoView()
        .environment(User())
}
