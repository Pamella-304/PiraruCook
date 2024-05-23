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
                    
                    UserDefaults.standard.setValue(appleUserData, forKey: "appleUser_\(appleUser.userID)")
                    UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                } else {
                    // Handle case where appleUser couldn't be created
                    showAlert = true
                    alertMessage = "Não foi possível criar o usuário Apple"
                }
                
                
            default:
                break
            }
        case .failure(_):
            showAlert = true
            alertMessage = "Falha na autenticação Apple"    
        }
    }
    
    func verificacaoLogin() {
        
        guard !email.isEmpty && !senha.isEmpty else {
            showAlert = true
            alertMessage = "Preencha todos os campos"
            return
        }
        
        let userIDs = UserDefaults.standard.dictionaryRepresentation().keys.filter { $0.hasPrefix("user_") }
                
        for userID in userIDs {
            if let userData = UserDefaults.standard.data(forKey: userID) {
                do {
                    let user = try JSONDecoder().decode(User.self, from: userData)
                    if user.email == email && user.password == senha {
                        isLoggedIn = true
                        UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                        break
                    }
                } catch {
                    showAlert = true
                    alertMessage = "Login e/ou senha incorreto(s)"
                }
            }
        }
        
    }
    
}
