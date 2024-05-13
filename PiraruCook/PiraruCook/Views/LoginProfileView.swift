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
                    
                    //inserir navigation link para página logada
                    
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
        //let userarray = getAllUsers()
            
        
    }
    func configure(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
      //  print("resquested")
    }
    
    func handle(_ authResult: Result<ASAuthorization, Error>) {
        switch authResult {
        case .success(let auth):
           // print(auth)
            switch auth.credential {
            case let appleIDCredentials as ASAuthorizationAppleIDCredential:
                
                isLoggedIn = true
                
                if let appleUser = AppleUser(credentials: appleIDCredentials),
                   let appleUserData =  try? JSONEncoder().encode(appleUser) {
                    
                    UserDefaults.standard.setValue(appleUserData, forKey: appleUser.userID)
                   // print("saved Apple User", appleUser)
                    
                } else {
                    
                 //   print("missing some fileds", appleIDCredentials.email, appleIDCredentials.fullName, appleIDCredentials.user)
                    
                    guard
                        let appleUserData = UserDefaults.standard.data(forKey: appleIDCredentials.user),
                        let appleUser = try? JSONDecoder().decode(AppleUser.self, from: appleUserData)
                            
                    else {return}
                    
                //    print(appleUser)
                }
                
            default:
           //     print(auth.credential)
                print("a")
            }
        case .failure(let error):
        //    print(error)
            print("b")
        }
    }
    
    func verificacaoLogin() {
        
        guard !email.isEmpty && !senha.isEmpty else {
             // Exibe um alerta se o email ou a senha estiverem vazios
     //        showAlert(message: "Por favor, preencha todos os campos.")
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
                // Login bem-sucedido
                self.isLoggedIn = true
                // Limpa os campos
            print("Usuário logado")
            LoggedProfileView(isLoggedIn: $isLoggedIn)
            
            } else {
                // Exibe um alerta se o login falhar
      //          showAlert(message: "E-mail ou senha incorretos.")
        print("email incorreto")
            }
    }
    
    func getAllUsers() -> [User] {
        var users: [User] = []
        
        // Obtém todas as chaves do UserDefaults
        let keys = UserDefaults.standard.dictionaryRepresentation().keys
        
        // Itera sobre as chaves
        for key in keys {
            // Verifica se a chave começa com "user_"
            if key.hasPrefix("user_") {
                // Obtém os dados associados à chave
                if let userData = UserDefaults.standard.data(forKey: key) {
                    // Decodifica os dados em um objeto User e adiciona à lista
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
