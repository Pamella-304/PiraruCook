//
//  PiraruCookApp.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 24/04/24.
//

import SwiftUI

@main
struct PiraruCookApp: App {
    
    @State private var cart = CartViewModel()
    @State var user: User = User(userName: "",firstName: "", lastName: "", birthDate: Date.now, address: "", email: "", password: "", cpf: "", boi: Boi.caprichoso)
    
    init() {
        
        UINavigationBar.appearance().backgroundColor = UIColor.white
        

            
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font: Fonts.largeTitleFont,
            .foregroundColor: UIColor(.brandPrimary)
        ]
        
        UINavigationBar.appearance().titleTextAttributes = [
            .font: Fonts.title3Font,
            .foregroundColor: UIColor(.brandPrimary)
        ]
        
        loadUserData()
        for familyName in UIFont.familyNames {
            print(familyName)
            
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("--\(fontName)")
            }
            
        }
        
    }
    

    var body: some Scene {
        
        WindowGroup {

            TabBarView()
                .environment(cart)
                .environment(user)
                .task {
                    loadUserData()
                }
        }
        
        
    }

    
    func loadUserData() {
        if let userID = UserDefaults.standard.dictionaryRepresentation().keys.first(where: { $0.hasPrefix("user_") }) {
            if let userData = UserDefaults.standard.data(forKey: userID) {
                do {
                    // Decodifica os dados do usuário
                    let myUser = try JSONDecoder().decode(User.self, from: userData)
                    self.user = myUser
                } catch {
                    print("Erro ao decodificar usuário:", error)
                }
            }
        }
        
        
        // Se não encontrar usuário normal, tenta carregar usuário Apple

        if user == nil, let appleUserID = UserDefaults.standard.dictionaryRepresentation().keys.first(where: { $0.hasPrefix("appleUser_") }) {
                    if let appleUserData = UserDefaults.standard.data(forKey: appleUserID) {
                        do {
                            let appleUser = try JSONDecoder().decode(AppleUser.self, from: appleUserData)
                            self.user = User(
                                userName: appleUser.userName ?? "Apple User",
                                firstName: "",
                                lastName: "",
                                birthDate: Date(),
                                address: "",
                                email: appleUser.email ?? "",
                                password: "",
                                cpf: ""
                            ) // Crie um User a partir dos dados do AppleUser
                        } catch {
                            print("Erro ao decodificar usuário Apple:", error)
                        }
                    }
                }
        
    }
    
    
}
