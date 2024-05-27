//
//  ChooseBoiSheet.swift
//  PiraruCook
//
//  Created by Breno Harris on 14/05/24.
//

import SwiftUI

struct ChooseBoiSheet: View {
    @Environment(\.dismiss) var dismiss
    @Environment(User.self) var user
    var body: some View {
        VStack {
            
            Text("Está chegando o festival de Parintins")
                .padding()
                .font(Font(Fonts.title4Font))
                .foregroundStyle(.brandSecondary)
            Text("Declare sua torcida!")
                .font(Font(Fonts.title1Font))
                .foregroundStyle(.brandPrimary)
            Spacer()
            HStack {
                VStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(user.boi == SelectedBoi.caprichoso ? .blue : .white, lineWidth: 1.5)
                        .frame(width: 128, height: 128)
                        .opacity(1)
                        .overlay {
                            Button {
                                user.boi = SelectedBoi.caprichoso
                            } label: {
                                VStack {
                                    Text("🐂🔵")
                                        .font(.title)
                                    Text("Eu sou Caprichoso!")
                                        .foregroundStyle(.blue)
                                }
                            }
                            
                        }
                    
                }
                
                .padding(32)
                .font(.headline)
                Spacer()
                VStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke( user.boi == SelectedBoi.garantido ? .red : .white, lineWidth: 1.5)
                        .frame(width: 128, height: 128)
                        .opacity(1)
                        .overlay {
                            Button {
                                user.boi = SelectedBoi.garantido
                            } label: {
                                VStack {
                                    Text("🐂🔴")
                                        .font(.title)
                                    Text("Eu sou Garantido!")
                                        .foregroundStyle(.red)
                                }
                            }
                            
                        }
                }
                .padding(32)
                .font(.headline)
            }
            Spacer()
            Button {
                user.updateUser(user: user)
                dismiss()
            } label: {
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 64)
                    .foregroundStyle(.brandPrimary)
                    .overlay {
                        Text("Escolher meu Boi")
                            .foregroundStyle(.white)
                    }
                    .padding()
            }
            .disabled(user.boi != SelectedBoi.none ? false : true)
            
        }
        
    }
}

#Preview {
    ChooseBoiSheet()
}


