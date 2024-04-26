//
//  PiraruCookApp.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 24/04/24.
//

import SwiftUI

@main
struct PiraruCookApp: App {
    
    @State private var cart = Cart()
    
    var body: some Scene {
        WindowGroup {

            TabBarView()
                .environment(cart)
        }
    }
}
