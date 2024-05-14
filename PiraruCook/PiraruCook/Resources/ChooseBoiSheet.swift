//
//  ChooseBoiSheet.swift
//  PiraruCook
//
//  Created by Breno Harris on 14/05/24.
//

import SwiftUI

struct ChooseBoiSheet: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedBoi = SelectedBoi.none
    var body: some View {
        VStack {
            
            Text("Está chegando o festival de Parintins")
                .padding()
                .font(.title3)
                .foregroundStyle(.secondary)
            Text("Declare sua torcida!")
                .font(.title)
                .foregroundStyle(.primary)
            Spacer()
            HStack {
                VStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(selectedBoi == SelectedBoi.caprichoso ? .blue : .white, lineWidth: 1.5)
                        .frame(width: 128, height: 128)
                        .opacity(1)
                        .overlay {
                            Button {
                                selectedBoi = SelectedBoi.caprichoso
                            }label: {
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
                        .stroke( selectedBoi == SelectedBoi.garantido ? .red : .white, lineWidth: 1.5)
                        .frame(width: 128, height: 128)
                        .opacity(1)
                        .overlay {
                            Button {
                                selectedBoi = SelectedBoi.garantido
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
                print("Escolheu o boi \(selectedBoi)")
                dismiss()
            } label: {
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 64)
                    .foregroundStyle(.secondary)
                    .overlay {
                        Text("Escolher meu Boi")
                            .foregroundStyle(.primary)
                    }
                    .padding()
            }
            .disabled(selectedBoi != SelectedBoi.none ? false : true)
            
        }
        
    }
}

#Preview {
    ChooseBoiSheet()
}


enum SelectedBoi {
    case none, garantido, caprichoso
}
