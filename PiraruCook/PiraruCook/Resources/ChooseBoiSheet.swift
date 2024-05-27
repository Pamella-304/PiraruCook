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
        VStack(spacing: 0) {
            ZStack {
                HStack(spacing: -2) {
                    Button {
                        user.boi = SelectedBoi.caprichoso
                        user.updateUser(user: user)
                        dismiss()
                    } label: {
                        ZStack {
                            Image("FundoGarantido")
                                .resizable()
                                .ignoresSafeArea()
                            
                            Image("SouGarantido")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 190, height: 190)
                            
                        }
                    }
                    
                    
                        Button {
                            user.boi = SelectedBoi.caprichoso
                            user.updateUser(user: user)
                            dismiss()
                        } label: {
                            ZStack {
                                Image("FundoCaprichoso")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .ignoresSafeArea()
                                
                                Image("SouCaprichoso")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 190, height: 190)
                            }
                        }
                          
                    
                }
                
                VStack {
                    RoundedRectangle(cornerRadius: 0)
                        .frame(height: 150)
                        .foregroundStyle(.white)
                        .opacity(1)
                        .clipShape(
                            .rect(
                                bottomLeadingRadius: 16,
                                bottomTrailingRadius: 16
                            )
                        )
                        .overlay {
                            VStack {
                                Text("O festival de Parintins está chegando!")
                                    .padding(.horizontal)
                                    .font(Font(Fonts.title1Font))
                                    
                                    
                                Text("Escolha  sua torcida para apoiar seu Boi  favorito e ganhe cupons exclusivos!!")
                                    .font(Font(Fonts.title4Font))
                                
                            }
                        }
                    Spacer()
                    
                    
                }
            }
            
            
        }
        
    }
}

#Preview {
    ChooseBoiSheet()
        .environment(User())
}


