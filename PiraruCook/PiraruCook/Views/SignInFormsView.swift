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
    @State private var formattedCpf = ""
    
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        Form {
            Section(header: Text("Informações Pessoais")) {
                TextField("Nome", text: $name)
                DatePicker("Data de Nascimento", selection: $birthDate,in: ...Date(), displayedComponents: .date)
                    .foregroundColor(birthDate > Date() ? .red : .primary) // Altera a cor da data de nascimento para vermelho se for no futuro
                TextField("Endereço", text: $address)
                TextField("E-mail", text: $email)
                SecureField("Senha", text: $senha)
                TextField("CPF", text: $cpf)
                    .onChange(of: cpf) { newValue in
                        cpf = formatCPF(newValue)
                    }
                
            }
            
            Section(header: Text("Preferência de Boi")) {
                Picker("Preferência", selection: $selectedBoi) {
                    Text("Garantido").tag(Boi.garantido)
                    Text("Caprichoso").tag(Boi.caprichoso)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Button(action: {
                
                if senha.count >= 6
                    && birthDate < Date()
                    && isValidEmail(email) {
                    //&& cpf.isValidCPFFormat(){
                    saveUser()
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
        
        
        let newUser = User(name: name, birthDate: birthDate, address: address, email: email, password: senha, cpf: cpf, boi: selectedBoi)
        
        // Convertendo a estrutura de usuário para dados
        if let encodedUser = try? JSONEncoder().encode(newUser) {
            // Salvando os dados do usuário no UserDefaults
            let userID = UUID().uuidString
            
            UserDefaults.standard.set(encodedUser, forKey: "user_ \(userID)")
           // UserDefaults.standard.object(forKey: <#T##String#>)
            accountCreated = true
            isLoggedIn = true
            
        } else {
           // print("Erro ao salvar o usuário.")
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
    
 
}



extension String {
    func isValidCPFFormat() -> Bool {
        let cpfRegex = #"^\d{3}\.\d{3}\.\d{3}-\d{2}$"#
        return NSPredicate(format: "SELF MATCHES %@", cpfRegex).evaluate(with: self)
    }
}
