//
//  PaymentView.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 13/05/24.
//

import SwiftUI

struct PaymentView: View {
    var subtotal: Int
    var discount: Int
    var delivery: Int
    @State var paymentMethod: String
    @State var paymentSubtitle: String = ""
    @State private var finalPayment = false
   
    
    var body: some View {
        //MARK: Payment Method
        VStack{
            HStack{
                Text("Forma de Pagamento").bold()
                Spacer()
            }.padding(.horizontal)
            PaymentSections(usage: "Método de pagamento", img1: "rectangle.checkered", subtext: paymentSubtitle, text: paymentMethod)
            HStack{
                Text("Entrega").bold()
                Spacer()
            }.padding(.horizontal)
            PaymentSections(usage: "", img1: "mappin", subtext: "Entrega em até 40 min", text: "R. Silvio da Silva")
            HStack{
                Text("Desconto").bold()
                Spacer()
            }.padding(.horizontal)
            PaymentSections(usage: "", img1: "ticket.fill", subtext: "\(1) cupom disponível", text: "Cupom")
                
            Spacer()
            HStack{
                Text("Resumo da Compra").bold()
                Spacer()
            }.padding()
            ValuesSection(Title: "Subtotal", Price: subtotal)
            ValuesSection(Title: "Desconto", Price: discount)
            ValuesSection(Title: "Entrega", Price: delivery)
            ValuesSection(Title: "Total", Price: subtotal - discount + delivery)
            
            
            Button{
                // TODO: ended payment logic
                finalPayment = true
            }label: {
                Text("Finalizar Compra")
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.blue).bold()
            }
            .cornerRadius(10)
            .padding(16)
            
            
            
        
        }.navigationTitle("Pagamento").sheet(isPresented: $finalPayment) {
            ConfirmOrderView().presentationDetents([.fraction(0.3)])
        }
        
    }
}

#Preview {
    PaymentView(subtotal: 10, discount: 5, delivery: 10, paymentMethod: "Pix")
}
