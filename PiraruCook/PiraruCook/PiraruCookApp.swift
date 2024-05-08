//
//  PiraruCookApp.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 24/04/24.
//

import SwiftUI

@main
struct PiraruCookApp: App {
    let exampleUser = User(name: "Jonas da Silva", birthDate: Date.now, address: "", email: "", password: "", cpf: "", boi: Boi.caprichoso)
    @State private var cart = Cart()
    
    var body: some Scene {
        WindowGroup {

            TabBarView()
                .environment(cart)
        }
    }
}
