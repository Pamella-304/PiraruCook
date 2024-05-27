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
            
            Section {
                TextField("Primeiro nome", text: $viewModel.firstName)
                TextField("Sobrenome", text: $viewModel.lastName)
                TextField("Como deseja ser chamado?", text: $viewModel.userName)
            } header: {
                Text("Nome")
                    .font(Font(Fonts.title4Font))
                    .foregroundStyle(.brandSecondary)
            }
            .headerProminence(.increased)
            
            
            Section {
                TextField("E-mail", text: $viewModel.email)
            } header: {
                Text("E-mail")
                    .font(Font(Fonts.title4Font))
                    .foregroundStyle(.brandSecondary)
            }
            .headerProminence(.increased)
            
            Section {
                SecureField("Senha", text: $viewModel.senha)
            } header: {
                Text("Senha")
                    .font(Font(Fonts.title4Font))
                    .foregroundStyle(.brandSecondary)
            }
            .headerProminence(.increased)
            
            Section {
                TextField("CPF", text: $viewModel.cpf)
                    .onChange(of: viewModel.cpf) {
                        viewModel.formatCPF()
                    }
            } header: {
                Text("CPF")
                    .font(Font(Fonts.title4Font))
                    .foregroundStyle(.brandSecondary)
            }
            .headerProminence(.increased)
            
            Section {
                TextField("Endereço", text: $viewModel.address)
            } header: {
                Text("Endereço")
                    .font(Font(Fonts.title4Font))
                    .foregroundStyle(.brandSecondary)
            }
            .headerProminence(.increased)
            
            Section {
                DatePicker("Data de Nascimento", selection: $viewModel.birthDate,in: ...Date(), displayedComponents: .date)
                    .foregroundColor(viewModel.birthDate > Date() ? .red : .primary)
            } header: {
                Text("Data de Nascimento")
                    .font(Font(Fonts.title4Font))
                    .foregroundStyle(.brandSecondary)
            }
            .headerProminence(.increased)
            
            Section {
                
            } footer: {
                Button {
                    
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
                } label: {
                    ButtonView(name: "Cadastrar", type: .primary)
                        .padding(EdgeInsets(top: -16, leading: -20, bottom: 0, trailing: -20))
                }
            }
            
        }
        
        .navigationTitle("Criar Conta")
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Erro"),
                  message: Text(viewModel.alertMessage),
                  dismissButton: .default(Text("OK")))
        }
        
        
        
    }
    
}

#Preview {
    SignInFormsView()
        .environment(Router())
        .environment(User())
}
