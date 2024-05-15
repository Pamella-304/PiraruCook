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
    @State private var userName = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDate = Date()
    @State private var address = ""
    @State private var email = ""
    @State private var senha = ""
    @State private var cpf = ""
    @State private var selectedBoi: Boi = .garantido
    @State private var accountCreated = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var formattedCpf = ""
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        Form {
            Section(header: Text("Informações Pessoais")) {
                
                TextField("Primeiro nome", text: $firstName)
                TextField("Sobrenome", text: $lastName)
                TextField("Como deseja ser chamado?", text: $userName)
                DatePicker("Data de Nascimento", selection: $birthDate,in: ...Date(), displayedComponents: .date)
                    .foregroundColor(birthDate > Date() ? .red : .primary)
                TextField("Endereço", text: $address)
                TextField("E-mail", text: $email)
                SecureField("Senha", text: $senha)
                TextField("CPF", text: $cpf)
                    .onChange(of: cpf) { oldValue, newValue in
                        cpf = formatCPF(newValue)
                    }
                
            }
            
            
            Button(action: {
                
                if senha.count >= 6
                    && birthDate < Date()
                    && isValidEmail(email) {
                    saveUser()
                    let usersArray = getAllUsers()
                    stackPathProfile.path.append(RouterData(screen: .LoggedProfile))
                    
                } else {
                    showAlert = true
                    if !(senha.count >= 6) {
                        alertMessage = "A senha deve ter no mínimo 6 caracteres"
                    } else if !(cpf.count == 11) || !(cpf.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil) {
                        alertMessage = "Formato de CPF inválido"
                    } else if birthDate > Date() {
                        alertMessage = "Data de nascimento inválida!"
                    } else if !isValidEmail(email) {
                        alertMessage = "E-mail inválido!"
                    } else {
                        alertMessage = "Erro no cadastro. Reverifique os campos preenchidos."
                    }
                }
            }
            ) {
                Text("Cadastrar")
            }
            
            .navigationTitle("Cadastrar")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Erro"),
                      message: Text(alertMessage),
                      dismissButton: .default(Text("OK")))
            }
        }
        

    }
    
    
    func saveUser() {
        
        if isEmailAlreadyRegistered(email) {
                showAlert = true
                alertMessage = "E-mail já cadastrado"
                return
        }
        
        if isCPFAlreadyRegistered(cpf) {
                showAlert = true
                alertMessage = "CPF já cadastrado"
                return
        }
            
        
        let newUser = User(userName: userName, firstName: firstName, lastName: lastName, birthDate: birthDate, address: address, email: email, password: senha, cpf: cpf, boi: selectedBoi)
        
        if let encodedUser = try? JSONEncoder().encode(newUser) {
            let userID = UUID().uuidString
            UserDefaults.standard.set(encodedUser, forKey: "user_ \(userID)")
            accountCreated = true
            isLoggedIn = true
            print("usuário salvo com sucesso")
        } else {
            showAlert = true
            alertMessage = "Erro ao cadastrar usuário. Tente novamente mais tarde."
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        
    }
    
    func formatCPF(_ cpf: String) -> String {
        var formattedCPF = cpf.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        if formattedCPF.count > 11 {
            formattedCPF = String(formattedCPF.prefix(11))
        }
        
        if formattedCPF.count > 9 {
            formattedCPF.insert(".", at: formattedCPF.index(formattedCPF.startIndex, offsetBy: 3))
            formattedCPF.insert(".", at: formattedCPF.index(formattedCPF.startIndex, offsetBy: 7))
            formattedCPF.insert("-", at: formattedCPF.index(formattedCPF.startIndex, offsetBy: 11))
        } else if formattedCPF.count > 6 {
            formattedCPF.insert(".", at: formattedCPF.index(formattedCPF.startIndex, offsetBy: 3))
            formattedCPF.insert(".", at: formattedCPF.index(formattedCPF.startIndex, offsetBy: 7))
        } else if formattedCPF.count > 3 {
            formattedCPF.insert(".", at: formattedCPF.index(formattedCPF.startIndex, offsetBy: 3))
        }
        
        return formattedCPF
        
    }
    
    func getAllUsers() -> [User] {
        
        var users: [User] = []
        let keys = UserDefaults.standard.dictionaryRepresentation().keys
        
        for key in keys {

            if key.hasPrefix("user_") {
                if let userData = UserDefaults.standard.data(forKey: key) {
                    if let user = try? JSONDecoder().decode(User.self, from: userData) {
                        users.append(user)
                    }
                }
            }
        }
        print("printando todos os usuários")
        print(users)
        
        return users
    }
    
    func isEmailAlreadyRegistered(_ email: String) -> Bool {

        let users = getAllUsers()
        
        return users.contains { $0.email == email }
    }

    func isCPFAlreadyRegistered(_ cpf: String) -> Bool {

        let users = getAllUsers()
        
        return users.contains { $0.cpf == cpf }
    }

}


extension String {
    func isValidCPFFormat() -> Bool {
        let cpfRegex = #"^\d{3}\.\d{3}\.\d{3}-\d{2}$"#
        return NSPredicate(format: "SELF MATCHES %@", cpfRegex).evaluate(with: self)
    }
}
