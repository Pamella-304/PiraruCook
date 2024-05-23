//
//  SignInFormsViewModel.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 15/05/24.
//

import SwiftUI

@Observable
class SignInFormsViewModel {
    var userName = ""
    var firstName = ""
    var lastName = ""
    var birthDate = Date()
    var address = ""
    var email = ""
    var senha = ""
    var cpf = ""
    var selectedBoi: Boi = .garantido
    var accountCreated = false
    var showAlert = false
    var alertMessage = ""
    var formattedCpf = ""
    
    func isValidAccount() -> Bool {
        senha.count >= 6 && birthDate < Date() && isValidEmail()
    }
    
    func isCPFAlreadyRegistered() -> Bool {

        let users = getAllUsers()
        
        return users.contains { $0.cpf == cpf }
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
    
    func isEmailAlreadyRegistered() -> Bool {

        let users = getAllUsers()
        
        return users.contains { $0.email == email }
    }
    
    func formatCPF() {
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
        
        cpf = formattedCPF
        
    }
    
    func isValidEmail() -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        
    }
    
    func saveUser(isLoggedIn:Bool, currentUser: User) -> (isLoggedIn: Bool, user: User?) {
        
        if isEmailAlreadyRegistered() {
            showAlert = true
            alertMessage = "E-mail já cadastrado"
                return (isLoggedIn, nil)
        }
        
        if isCPFAlreadyRegistered() {
            showAlert = true
            alertMessage = "CPF já cadastrado"
                return (isLoggedIn, nil)
        }
            
        
        var newUser = User(userName: userName,
                           firstName: firstName,
                           lastName: lastName,
                           birthDate: birthDate,
                           address: address,
                           email: email,
                           password: senha,
                           cpf: cpf,
                           boi: selectedBoi)
        
        
        if let encodedUser = try? JSONEncoder().encode(newUser) {
            let userID = UUID().uuidString
            UserDefaults.standard.set(encodedUser, forKey: "user_")
            accountCreated = true
            print("usuário salvo com sucesso")
            return (true, newUser)
        } else {
            showAlert = true
            alertMessage = "Erro ao cadastrar usuário. Tente novamente mais tarde."
            return (isLoggedIn, nil)
        }
    }
}
