//
//  ProfileView.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 02/05/24.
//
import AuthenticationServices
import SwiftUI

struct ProfileView: View {
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userID") var userID: String = ""

    private var isSignedIn: Bool {
        !userID.isEmpty
    }
    
    var body: some View {
        VStack{
            
            if !isSignedIn {
                ProfileViewModel()
            }
            
           
            
        }.navigationTitle("Fazer login")
    }
        
        
}

struct ProfileViewModel: View {
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userID") var userID: String = ""
    
    var body: some View {
        
        SignInWithAppleButton(.signIn) { request in
            
            request.requestedScopes = [.email, .fullName]
            
        } onCompletion: { result in
            
            switch result {
            case .success(let auth):
                switch auth.credential {
                case let credential as ASAuthorizationAppleIDCredential:
                    
                    let userID = credential.user
                    
                    let email = credential.email
                    let firstName = credential.fullName?.givenName
                    let lastName = credential.fullName?.familyName
                    
                    self.userID = userID
                    self.email = email ?? ""
                    self.firstName = firstName ?? ""
                    self.lastName = lastName ?? ""
                    
                default:
                    break
                }
            case .failure(let error):
                print(error)
            }
        }.frame(height: 50)
            .padding()
            .cornerRadius(8)
    }
}

#Preview {
    ProfileView()
}
