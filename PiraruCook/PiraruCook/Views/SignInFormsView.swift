//
//  SignInProfileView.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 07/05/24.
//

import Foundation
import SwiftUI

struct SignInFormsView: View {
    
    @EnvironmentObject var stackPathProfile: Router
    @State var viewModel = SignInFormsViewModel()
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        Form {
            Section(header: Text("Informações Pessoais")) {
                
                TextField("Primeiro nome", text: $viewModel.firstName)
                TextField("Sobrenome", text: $viewModel.lastName)
                TextField("Como deseja ser chamado?", text: $viewModel.userName)
                DatePicker("Data de Nascimento", selection: $viewModel.birthDate,in: ...Date(), displayedComponents: .date)
                    .foregroundColor(viewModel.birthDate > Date() ? .red : .primary)
                TextField("Endereço", text: $viewModel.address)
                TextField("E-mail", text: $viewModel.email)
                SecureField("Senha", text: $viewModel.senha)
                TextField("CPF", text: $viewModel.cpf)
                    .onChange(of: viewModel.cpf) { oldValue, newValue in
                        viewModel.formatCPF()
                    }
                
            }
            
            
            Button{
                
                if viewModel.isValidAccount() {
                    isLoggedIn = viewModel.saveUser(isLoggedIn: isLoggedIn)
//                    let usersArray = viewModel.getAllUsers()
                    stackPathProfile.path.append(RouterData(screen: .LoggedProfile))
                    
                } else {
                    viewModel.showAlert = true
                    if !(viewModel.senha.count >= 6) {
                        viewModel.alertMessage = "A senha deve ter no mínimo 6 caracteres"
                    }  else if viewModel.birthDate > Date() {
                        viewModel.alertMessage = "Data de nascimento inválida!"
                    } else if !viewModel.isValidEmail() {
                        viewModel.alertMessage = "E-mail inválido!"
                    } else {
                        viewModel.alertMessage = "Erro no cadastro. Reverifique os campos preenchidos."
                    }
                }
                
            } label: {
                Text("Cadastrar")
            }
            
            .navigationTitle("Cadastrar")
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Erro"),
                      message: Text(viewModel.alertMessage),
                      dismissButton: .default(Text("OK")))
            }
        }
        

    }

}

