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
    @Environment(User.self) var user
    @State var viewModel = SignInFormsViewModel()
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        Form {
            Section("Nome") {
                TextField("Primeiro nome", text: $viewModel.firstName)
                TextField("Sobrenome", text: $viewModel.lastName)
                TextField("Como deseja ser chamado?", text: $viewModel.userName)
            }
            .padding(4)
            
            
            
            Section("Email") {
                TextField("E-mail", text: $viewModel.email)
            }
            .padding(4)
            
            Section("Senha") {
                SecureField("Senha", text: $viewModel.senha)
            }
            .padding(4)
            
            Section("CPF") {
                TextField("CPF", text: $viewModel.cpf)
                    .onChange(of: viewModel.cpf) {
                        viewModel.formatCPF()
                    }
            }
            .padding(4)
            
            Section("Endereço") {
                TextField("Endereço", text: $viewModel.address)
            }
            .padding(4)
            
            Section("Data de Nascimento") {
                DatePicker("Data de Nascimento", selection: $viewModel.birthDate,in: ...Date(), displayedComponents: .date)
                    .foregroundColor(viewModel.birthDate > Date() ? .red : .primary)
            }
            .padding(4)
            
            Button("Cadastrar") {
                
                if viewModel.isValidAccount() {
                    var result = viewModel.saveUser(isLoggedIn: isLoggedIn, currentUser: user)
                    
                    isLoggedIn = result.isLoggedIn
                    if let newUser = result.user {
                        user.updateUser(user: newUser)
                    }
                    
                    stackPathProfile.goToRoot()
                    
                    
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
            }
            .buttonBorderShape(.capsule)

            
        }
        
        .navigationTitle("Criar Conta")
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Erro"),
                  message: Text(viewModel.alertMessage),
                  dismissButton: .default(Text("OK")))
        }
        
        
        
    }

}

