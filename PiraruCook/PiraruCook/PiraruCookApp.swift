//
//  PiraruCookApp.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 24/04/24.
//

import SwiftUI

@main
struct PiraruCookApp: App {
//    let exampleUser = User(userName: "Jonas Silva",firstName: "Jonas", lastName: "da Silva", birthDate: Date.now, address: "", email: "", password: "", cpf: "", boi: Boi.caprichoso)
    
    @State private var cart = CartViewModel()
    @State var user: User = User(userName: "Jonas Silva",firstName: "Jonas", lastName: "da Silva", birthDate: Date.now, address: "", email: "", password: "", cpf: "", boi: Boi.caprichoso)
    
    init() {
        loadUserData()
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
            if let userID = UserDefaults.standard.dictionaryRepresentation().keys.first(where: { $0.hasPrefix("user_ ") }) {
                if let userData = UserDefaults.standard.data(forKey: userID) {
                    do {
                        // Decodifica os dados do usuário
                        var myUser = try JSONDecoder().decode(User.self, from: userData)
                        self.user.updateUser(user: myUser) // Define o usuário recuperado na variável de estado
                        print(user)
                    } catch {
                        print("Erro ao decodificar usuário:", error)
                    }
                }
            }
    }
    
}
