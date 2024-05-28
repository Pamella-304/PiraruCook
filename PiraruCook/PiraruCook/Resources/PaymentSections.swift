//
//  PaymentSections.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 13/05/24.
//

import SwiftUI

struct PaymentSections: View {
    @Environment(CartViewModel.self) private var viewModel
    var usage: String
    var img1: String
    var subtext: String
    var text: String
    @State private var paymentSheets = false
    @State private var changeMethod = false
    @State private var chooseCoupon = false
    @State private var sheetFraction = 0.25
    
    
    
    var body: some View {
        HStack {
            Image(systemName: img1)
            VStack(alignment: .leading) {
                Text(text)
                    .bold()
                // TODO: Retrive number of cupons
                
                if subtext == ""{
                    
                }else{
                    Text(subtext)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
            Button {
                paymentSheets = true
                switch usage{
                case "Método de pagamento":
                    changeMethod = true
                    sheetFraction = 0.25
                case "Cupom":
                    chooseCoupon = true
                    print("\(changeMethod)")
                    sheetFraction = 0.28
                case "Entrega":
                    sheetFraction = 1
                default:
                    print("")
                    
                }
                
                
            } label: {
                Text("Trocar")
                    .bold()
            }
        }.sheet(isPresented: $paymentSheets) {
            switch usage{
            case "Método de pagamento":
                ChangeMethodView().presentationDetents([.fraction(sheetFraction)])
            case "Cupom":
                CouponView().presentationDetents([.fraction(sheetFraction)])
            case "Entrega":
                EditAddressView()
            default:
                ChangeMethodView()
            }
            
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
    }
}

#Preview {
    PaymentSections(usage:"Método de pagamento", img1: "ticket.fill",subtext: "\(1) cupons disponíveis",text: "Cupom")
}
