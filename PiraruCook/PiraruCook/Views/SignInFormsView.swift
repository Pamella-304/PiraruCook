//
//  SignInProfileView.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 07/05/24.
//

import SwiftUI

struct SignInFormsView: View {
    @State private var name = ""
    @State private var birthDate = Date()
    @State private var address = ""
    @State private var email = ""
    @State private var senha = ""
    @State private var cpf = ""
    @State private var selectedBoi: Boi = .garantido
    @State private var accountCreated = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        Form {
            Section(header: Text("Informações Pessoais")) {
                TextField("Nome", text: $name)
                DatePicker("Data de Nascimento", selection: $birthDate, displayedComponents: .date)
                TextField("Endereço", text: $address)
                TextField("E-mail", text: $email)
                SecureField("Senha", text: $senha)
                TextField("CPF", text: $cpf)
            }
            
            Section(header: Text("Preferência de Boi")) {
                Picker("Preferência", selection: $selectedBoi) {
                    Text("Garantido").tag(Boi.garantido)
                    Text("Caprichoso").tag(Boi.caprichoso)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Button("Cadastrar") {
                                
                if senha.count >= 6 && cpf.count == 11 && cpf.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil {
                    saveUser()
                } else {
                    showAlert = true
                    if !(senha.count >= 6) {
                        alertMessage = "A senha deve ter no mínimo 6 caracteres"
                    } else if !(cpf.count == 11) || !(cpf.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil) {
                       alertMessage = "Formato de CPF inválido"
                    } else {
                        alertMessage = "Erro no cadastro. Reverifique os campos preenchidos."
                    }
                }
            }
        }.navigationTitle("Cadastrar")
            .background(
                NavigationLink(destination: LoggedProfileView(isLoggedIn: $isLoggedIn), isActive: $accountCreated) {
                    EmptyView()
                }
            )
            .alert(isPresented: $showAlert) {
                    
                    Alert(title: Text("Erro"), 
                          message: Text(alertMessage),
                          dismissButton: .default(Text("OK")))
            }
    }
    
    func saveUser() {
        
        
        let newUser = User(name: name, birthDate: birthDate, address: address, email: email, password: senha, cpf: cpf, boi: selectedBoi)
        
        // Convertendo a estrutura de usuário para dados
        if let encodedUser = try? JSONEncoder().encode(newUser) {
        // Salvando os dados do usuário no UserDefaults
            let userID = UUID().uuidString

            UserDefaults.standard.set(encodedUser, forKey: "user_ \(userID)")
            
            accountCreated = true
            isLoggedIn = true
            
        } else {
            print("Erro ao salvar o usuário.")
        }
    }
    
}


