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
    @Environment(User.self) private var user: User?
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var viewModel =  LoginProfileViewModel()
    
    var body: some View {
        
        VStack{
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Senha", text: $viewModel.senha)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Entrar") {
                viewModel.verificacaoLogin()
            }.padding()
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Erro"),
                          message: Text(viewModel.alertMessage),
                          dismissButton: .default(Text("OK")))
                }
            
            Button("Criar Conta"){
                stackPathProfile.path.append(RouterData(screen: .SignInForms))
            }
            .padding()
            Spacer()
            
            SignInWithAppleButton(
                .signIn,
                onRequest: viewModel.configure,
                onCompletion: viewModel.handle
            )
            .frame(height: 45)
            .padding()
            .colorInvert()
        }
        .onAppear{
            
        }
    }
    
}
