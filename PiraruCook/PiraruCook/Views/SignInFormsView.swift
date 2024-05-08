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
    
    var body: some View {
        Form {
            Section(header: Text("Informações Pessoais")) {
                TextField("Nome", text: $name)
                DatePicker("Data de Nascimento", selection: $birthDate, displayedComponents: .date)
                TextField("Endereço", text: $address)
                TextField("E-mail", text: $email)
                TextField("Senha", text: $senha)
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
                saveUser()
            }
            
        }
    }
    
    func saveUser() {
        let newUser = User(name: name, birthDate: birthDate, address: address, email: email, password: senha, cpf: cpf, boi: selectedBoi)
        
        // Convertendo a estrutura de usuário para dados
        if let encodedUser = try? JSONEncoder().encode(newUser) {
        // Salvando os dados do usuário no UserDefaults
            let userID = UUID().uuidString

            UserDefaults.standard.set(encodedUser, forKey: "user_ \(userID)")
        } else {
            print("Erro ao salvar o usuário.")
        }
    }
    
}

