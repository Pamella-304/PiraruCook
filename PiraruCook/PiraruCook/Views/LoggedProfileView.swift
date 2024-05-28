//
//  LoggedProfileView.swift
//  PiraruCook
//
//  Created by Breno Harris on 07/05/24.
//

import SwiftUI

struct LoggedProfileView: View {
    
    @Environment(Router.self) private var stackPathProfile
    @Environment(User.self) private var user: User?
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var isShowingDialog = false
    @State private var isShowingSheet = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                //user name nao esta atualizando na primeira run do app
                if let presentedUserName = user?.userName {
                    Text(presentedUserName)
                        .font(Font(Fonts.title1Font))
                } else {
                    Text("Nome usuario")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                }
                Spacer()
                NavigationLink(value: RouterData(screen: Views.Configuration)) {
                    Image(systemName: "pencil")
                        .resizable()
                    
                        .frame(width: 24, height: 24)
                    
                }
                .environment(user)
                .foregroundStyle(.primary)
            }
            Divider()
            HStack {
                NavigationLink(value: RouterData(screen: Views.PaymentMethods)) {
                    ProfileOptionsView(imageName: "creditcard.fill", title:
                                        "Pagamentos", description: "Preferências de transferência")
                }
                .foregroundStyle(.primary)
            }
            Divider()
            
            NavigationLink(value: RouterData(screen: Views.Addresses)) {
                ProfileOptionsView(imageName: "mappin", title:
                                    "Endereços", description: "Preferências de endereço de entrega")
            }
            .environment(user)
            .foregroundStyle(.primary)
            
            Divider()
            
            NavigationLink(value: RouterData(screen: Views.PreviousOrders)) {
                
                ProfileOptionsView(imageName: "book.pages.fill", title: "Histórico", description: "Histórico de pedidos")
            }
            .foregroundStyle(.primary)
            
            Divider()
            Button {
                isShowingSheet.toggle()
            } label: {
                ProfileOptionsView(imageName: "party.popper.fill", title:
                                    "Festival de Parintins", description: "Acesse as informações do evento atual")
                .foregroundStyle(.black)
            }
           
        
            
            Divider()
            
            Button {
                isShowingDialog = true
            } label: {
                Text("Encerrar sessão")
                    .font(Font(Fonts.title4Font))
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.brandPrimary)
            .padding()
            .confirmationDialog("Tem certeza que deseja encerrar a sessão?", isPresented: $isShowingDialog, titleVisibility: .visible) {
                Button("Confirmar",role: .destructive) {
                    isLoggedIn = false
                    stackPathProfile.goToRoot()
                }
                
                Button("Cancelar", role: .cancel) {
                    
                }
            }
            
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("Perfil")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.large)
        
        .sheet(isPresented: $isShowingSheet) {
            ChooseBoiSheet()
        }
    }
    
}

#Preview {
    LoggedProfileView()
        .environment(Router())
        .environment(User(userName: "haha",
                          firstName: "haha",
                          lastName: "haha",
                          birthDate: Date(),
                          address: "haha",
                          email: "fad@mail.com",
                          password: "231231231",
                          cpf: "123.123.123-23",
                          boi: .caprichoso,
                          registeredAdresses: [Address(location: "asda",
                                                       nickname: "asdas",
                                                       picture: "asda")]))
}
