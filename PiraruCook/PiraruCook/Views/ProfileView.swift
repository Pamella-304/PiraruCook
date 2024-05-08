//
//  Profile2View.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 06/05/24.
//

import Combine
import AuthenticationServices
import SwiftUI

struct ProfileView: View {
    
    @AppStorage("isLoggedIn") private var isLoggedIn = true
    
    var body: some View {
        NavigationView{
            
            if isLoggedIn {
                LoggedInView()
            } else {
                
                SignInWithAppleButton(
                    .signIn,
                    onRequest: configure,
                    onCompletion: handle
                )
                .frame(height: 45)
                .padding()
            }
        }
    }
    func configure(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
        print("resquested")
    }
    
    func handle(_ authResult: Result<ASAuthorization, Error>) {
        switch authResult {
        case .success(let auth):
            print(auth)
            switch auth.credential {
            case let appleIDCredentials as ASAuthorizationAppleIDCredential:
                
                isLoggedIn = true
                
                if let appleUser = AppleUser(credentials: appleIDCredentials),
                    let appleUserData =  try? JSONEncoder().encode(appleUser) {
                        UserDefaults.standard.setValue(appleUserData, forKey: appleUser.userID)
                        print("saved Apple User", appleUser)
                    } else {
                        print("missing some fileds", appleIDCredentials.email, appleIDCredentials.fullName, appleIDCredentials.user)
                        
                        guard
                            let appleUserData = UserDefaults.standard.data(forKey: appleIDCredentials.user),
                            let appleUser = try? JSONDecoder().decode(AppleUser.self, from: appleUserData)
                        else {return}
                        
                        print(appleUser)
                    }
                
            default:
                print(auth.credential)
            }
        case .failure(let error):
            print(error)
        }
    }
}





#Preview {
    ProfileView()
}
