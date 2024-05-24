//
//  AddingNewAddressView.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 24/05/24.
//

import SwiftUI

struct AddingNewAddressView: View {
    @Environment(\.dismiss) var dismiss
    @State var nomeEnd = ""
    @State var End = ""
    @State var numEnd = ""
    @State var cepEnd = ""
    
    var body: some View {
        VStack{
            List{
                Section("Nome do endereço"){
                    TextField("Nome do endereço", text: $nomeEnd)
                }
                Section("Dados do endereço"){
                    TextField("Endereço", text: $End)
                    TextField("Número", text: $numEnd)
                    TextField("CEP", text: $cepEnd)
                }
                
            }
           
            Button{
                dismiss()
            }label: {
                Text("Salvar alterações").font(Font(Fonts.title3Font))
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.brandPrimary).bold()
            } .cornerRadius(10)
                .padding(16)
        }
    }
}

#Preview {
    AddingNewAddressView()
}
