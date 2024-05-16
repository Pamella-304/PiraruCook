//
//  LoginProfileViewModel.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 16/05/24.
//

import SwiftUI

@Observable
class LoginProfileViewModel{
    
    var email = ""
    var senha = ""
    var creatingAccount = false
    var showAlert = false
    var alertMessage = ""
}
