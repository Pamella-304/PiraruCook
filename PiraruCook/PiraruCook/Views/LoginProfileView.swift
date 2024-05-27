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
    @State private var viewModel =  LoginProfileViewModel()
    
    var body: some View {
        
        VStack{
            
            Image("logoPlaceHolder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 32)
                .padding(.bottom, 32)
                .padding(.top, 16)
            
            Form {
                TextField("Email", text: $viewModel.email)
                TextField("Senha", text: $viewModel.senha)
            }
            .frame(height: 150)
            .padding(.horizontal, -16)
            .scrollDisabled(true)
            
            Spacer()
            
            VStack(spacing: 16) {
                
                Button(action: {
                    viewModel.verificacaoLogin()
                    
                }) {
                    ButtonView(name: "Iniciar sessão", type: .primary)
                }
                .frame(maxWidth: .infinity, minHeight: 41, alignment: .center)
                .background(Color.brandPrimary)
                .cornerRadius(10)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Erro"),
                          message: Text(viewModel.alertMessage),
                          dismissButton: .default(Text("OK")))
                }
                
                LocalizedSignInWithAppleButton(
                    type: .signIn,
                    style: .black,
                    locale: Locale(identifier: "pt_BR") // Força o botão para o português do Brasil
                )
                .cornerRadius(10)
                .frame(height: 41)
                
                Button(action: {
                    
                }) {
                    ButtonView(name: "Iniciar sessão como convidado", type: .secundary)
                    
                }
                .frame(maxWidth: .infinity, minHeight: 41, alignment: .center)
                .background(Color.brandSenary)
                .cornerRadius(10)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Erro"),
                          message: Text(viewModel.alertMessage),
                          dismissButton: .default(Text("OK")))
                }
            }
            
            Spacer()
            
            Text("Não tem uma conta?")
                .font(Font(Fonts.title4Font))
            
            Button("Criar agora"){
                stackPathProfile.path.append(RouterData(screen: .SignInForms))
            }
            .font(Font(Fonts.title4Font))
            .foregroundColor(.black)
        }
        .padding()
        .background(.colorBackground)
        .onAppear{
            viewModel.isLoggedIn = isLoggedIn
        }
        
    }
    
    
    struct LocalizedSignInWithAppleButton: UIViewRepresentable {
        var type: ASAuthorizationAppleIDButton.ButtonType
        var style: ASAuthorizationAppleIDButton.Style
        var locale: Locale
        
        func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
            let button = ASAuthorizationAppleIDButton(type: type, style: style)
            
            // Set the locale for the button (this will apply the correct language)
            button.overrideUserInterfaceStyle = .dark // Example: ensure the button is in dark mode if needed
            return button
        }
        
        func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
            // No need to update the view
        }
    }
}

#Preview {
    LoginProfileView()
        .environment(Router())
}
