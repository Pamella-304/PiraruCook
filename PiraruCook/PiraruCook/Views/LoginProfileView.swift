//
//  Profile2View.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 06/05/24.
//

import Combine
import AuthenticationServices
import SwiftUI

struct LoginProfileView: View {
    
    @Environment(Router.self) private var stackPathProfile
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var email = ""
    @State private var senha = ""
    @State private var creatingAccount = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
            
            if isLoggedIn {
                LoggedProfileView(isLoggedIn: $isLoggedIn)
                   
            } else {
                VStack{
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    SecureField("Senha", text: $senha)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Entrar") {
                        verificacaoLogin()
                    }.padding()
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Erro"),
                                  message: Text(alertMessage),
                                  dismissButton: .default(Text("OK")))
                        }
                                        
                    Button("Criar Conta"){
                        stackPathProfile.path.append(RouterData(screen: .SignInForms))
                    }
                    .padding()
                    Spacer()
                    
                    SignInWithAppleButton(
                        .signIn,
                        onRequest: configure,
                        onCompletion: handle
                    )
                    .frame(height: 45)
                    .padding()
                    .colorInvert()
                }
            }
            
        
    }
    
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

            print("preencha todos os campos")
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
            LoggedProfileView(isLoggedIn: $isLoggedIn)
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

}
