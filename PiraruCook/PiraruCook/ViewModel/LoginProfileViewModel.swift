//
//  LoginProfileViewModel.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 16/05/24.
//

import SwiftUI
import AuthenticationServices

@Observable
class LoginProfileViewModel{
    
    var email = ""
    var senha = ""
    var creatingAccount = false
    var showAlert = false
    var alertMessage = ""
    var isLoggedIn = false
    
    
    func configure(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
    
    func handle(_ authResult: Result<ASAuthorization, Error>) {
        switch authResult {
        case .success(let auth):
            switch auth.credential {
            case let appleIDCredentials as ASAuthorizationAppleIDCredential:
                
                isLoggedIn = true
                
                if let appleUser = AppleUser(credentials: appleIDCredentials),
                   let appleUserData =  try? JSONEncoder().encode(appleUser) {
                    
                    UserDefaults.standard.setValue(appleUserData, forKey: appleUser.userID)
                    
                } else {
                    
                    guard
                        let appleUserData = UserDefaults.standard.data(forKey: appleIDCredentials.user),
                        let appleUser = try? JSONDecoder().decode(AppleUser.self, from: appleUserData)
                            
                    else {return}
                    
                }
                
            default:
                print("a")
            }
        case .failure(let error):
            print("b")
        }
    }
    
    func verificacaoLogin() {
        
        guard !email.isEmpty && !senha.isEmpty else {
            showAlert = true
            alertMessage = "Preencha todos os campos"
            return
        }
        
        let userIDs = UserDefaults.standard.dictionaryRepresentation().keys.filter { $0.hasPrefix("user_") }
        
        var isLoggedIn = false
        
        for userID in userIDs {
            if let userData = UserDefaults.standard.data(forKey: userID) {
                do {
                    let user = try JSONDecoder().decode(User.self, from: userData)
                    if user.email == email && user.password == senha {
                        isLoggedIn = true
                        break
                    }
                } catch {
                    showAlert = true
                    alertMessage = "Login e/ou senha incorreto(s)"
                }
            }
        }
        
        if isLoggedIn {
            self.isLoggedIn = true
        }
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
        
        print(users)
        
        return users
    }
    
    func loadUserData() {
        if let userID = UserDefaults.standard.dictionaryRepresentation().keys.first(where: { $0.hasPrefix("user_ ") }) {
            if let userData = UserDefaults.standard.data(forKey: userID) {
                do {
                    // Decodifica os dados do usuário
                    let user = try JSONDecoder().decode(User.self, from: userData)
                    self.user?.updateUser(user: user) // Define o usuário recuperado na variável de estado
                } catch {
                    print("Erro ao decodificar usuário:", error)
                }
            }
        }
    }
    
}
