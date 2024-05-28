//
//  ChangeUserInfoView.swift
//  PiraruCook
//
//  Created by Breno Harris on 14/05/24.
//

import SwiftUI



struct ChangeUserInfoView: View {
    @Environment(User.self) private var user
    @Environment(\.dismiss) private var dismiss
    @State var viewModel = ChangeUserInfoViewModel()
    @State var confirmEmail = ""
    @State var confirmPassword = ""
    @State var newName = ""
    @State var newCPF = ""
    
    var body: some View {
        
        VStack {
            List {
                
                // TODO: Verificar e-mail
                Section {
                    TextField("Novo e-mail", text: $viewModel.currentEmail)
                    TextField("Confirmar e-mail", text: $confirmEmail)
                } header: {
                    Text("Alterar Email Cadastrado")
                        .font(Font(Fonts.title4Font))
                        .foregroundStyle(.brandSecondary)
                }
                .headerProminence(.increased)
                
                // TODO: Verificar conta
                Section {
                    TextField("Nova senha", text: $viewModel.newPassword)
                    TextField("Confirmar senha", text: $confirmPassword)
                } header: {
                    Text("Alterar Senha Cadastrada")
                        .font(Font(Fonts.title4Font))
                        .foregroundStyle(.brandSecondary)
                }
                .headerProminence(.increased)
                
                Section {
                    TextField("Nome", text: $newName)
                    TextField("CPF", text: $newCPF)
                } header: {
                    Text("Alterar dados pessoais")
                        .font(Font(Fonts.title4Font))
                        .foregroundStyle(.brandSecondary)
                }
                .headerProminence(.increased)
            }
            .scrollDisabled(true)
            
            // TODO: Atualizar CPF e nome
            Button {
                if ((viewModel.confirmInformation(written: viewModel.currentEmail, actual: user.email)) && (viewModel.confirmInformation(written: viewModel.currentPassword, actual: user.password))) {
                    
                    UserHelper.updateUser(user: user, newEmail: viewModel.newEmail, newPassword: viewModel.newPassword)
                    viewModel.alertMessage = "Usuario atualizado"
                    viewModel.alertTitle = "Sucesso"
                } else {
                    viewModel.alertTitle = "Erro"
                    viewModel.alertMessage = "Algum dos campos não condiz com o valor encontrado"
                }
                viewModel.showAlert.toggle()
            } label: {
                ButtonView(name: "Salvar Alterações", type: .primary)
                    .padding()
            }
            .foregroundStyle(.brandPrimary)
            .padding()
            
        }
        .navigationTitle("Alteração de Dados")
        .navigationBarTitleDisplayMode(.inline)
        .background(.colorBackground)
   
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
