//
//  PaymentSections.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 13/05/24.
//

import SwiftUI

struct PaymentSections: View {
    var usage: String
    var img1: String
    var subtext: String
    var text: String
    @State private var changeMethod = false
    
    
    
    var body: some View {
        HStack {
            Image(systemName: img1)
            VStack(alignment: .leading) {
                Text(text)
                    .bold()
                // TODO: Retrive number of cupons
                if text == "Pix"{
                    
                }else{
                    Text(subtext)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
            Button {
                switch usage{
                case "Método de pagamento":
                    changeMethod = true
                default:
                    print("1")
                    
                }
                
                
            } label: {
                Text("Trocar")
                    .bold()
            }
        }.sheet(isPresented: $changeMethod) {
            ChangeMethodView().presentationDetents([.fraction(0.25)])
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
    }
}

#Preview {
    PaymentSections(usage:"Método de pagamento", img1: "ticket.fill",subtext: "\(1) cupons disponíveis",text: "Cupom")
}
