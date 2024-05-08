//
//  AppleUser.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 06/05/24.
//

import AuthenticationServices

struct AppleUser: Codable {
    let userID: String
    let firstName: String
    let lastName: String
    let email: String

    init?(credentials: ASAuthorizationAppleIDCredential) {
        guard
            let firstName = credentials.fullName?.givenName,
            let lastName = credentials.fullName?.familyName,
            let email = credentials.email
                
        else {return nil}
        
        self.userID = credentials.user
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
