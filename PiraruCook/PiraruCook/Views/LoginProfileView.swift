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
    
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var email = ""
    @State private var senha = ""
    @State private var creatingAccount = false
    
    var body: some View {
        NavigationView{
            
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
                    
                    //inserir navigation link para página logada
                    
                    NavigationLink(destination: SignInFormsView(), isActive: $creatingAccount) {
                        Text("Cria Conta")
                        
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
    }
    func configure(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
        print("resquested")
    }
    
    func handle(_ authResult: Result<ASAuthorization, Error>) {
        switch authResult {
        case .success(let auth):
            print(auth)
            switch auth.credential {
            case let appleIDCredentials as ASAuthorizationAppleIDCredential:
                
                isLoggedIn = true
                
                if let appleUser = AppleUser(credentials: appleIDCredentials),
                   let appleUserData =  try? JSONEncoder().encode(appleUser) {
                    
                    UserDefaults.standard.setValue(appleUserData, forKey: appleUser.userID)
                    print("saved Apple User", appleUser)
                    
                } else {
                    
                    print("missing some fileds", appleIDCredentials.email, appleIDCredentials.fullName, appleIDCredentials.user)
                    
                    guard
                        let appleUserData = UserDefaults.standard.data(forKey: appleIDCredentials.user),
                        let appleUser = try? JSONDecoder().decode(AppleUser.self, from: appleUserData)
                            
                    else {return}
                    
                    print(appleUser)
                }
                
            default:
                print(auth.credential)
            }
        case .failure(let error):
            print(error)
        }
    }
    
    func verificacaoLogin() {
        
        let userIDs = UserDefaults.standard.dictionaryRepresentation().keys.filter { $0.hasPrefix("user_") }
        
        for userID in userIDs {
            if let userData = UserDefaults.standard.data(forKey: userID) {
                do {
                    let user = try JSONDecoder().decode(User.self, from: userData)
                    if user.email == email && user.password == senha {
                        isLoggedIn = true
                        return
                    }
                }
                catch {
                    print("usuario nao cadastrado")
                }
                
                
            }
        }
    }
    
    
}
