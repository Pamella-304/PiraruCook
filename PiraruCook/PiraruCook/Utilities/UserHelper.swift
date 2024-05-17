//
//  UserHelper.swift
//  PiraruCook
//
//  Created by Breno Harris on 16/05/24.
//

import Foundation

class UserHelper {
    
    
    static func updateUser(user: User, newEmail: String, newPassword: String) {
        user.email = newEmail
        user.password = newPassword
        
        if let encodedUser = try? JSONEncoder().encode(user) {
            let userID = UUID().uuidString
            UserDefaults.standard.set(encodedUser, forKey: "user_ \(userID)")
            print("usuário atualizado com sucesso")

        } else {
            print("erro atualizando o usuario")
        }
    }
    
}
