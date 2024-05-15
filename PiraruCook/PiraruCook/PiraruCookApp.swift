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
    let exampleUser = User(userName: "Jonas Silva",firstName: "Jonas", lastName: "da Silva", birthDate: Date.now, address: "", email: "", password: "", cpf: "", boi: Boi.caprichoso)
    
    var body: some Scene {
        WindowGroup {

            TabBarView()
                .environment(cart)
        }
    }
}
