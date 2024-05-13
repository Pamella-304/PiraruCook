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
   
    
    var body: some View {
        //MARK: Payment Method
        VStack{
            HStack{
                Text("Forma de Pagamento").bold()
                Spacer()
            }.padding(.horizontal)
            PaymentSections(img1: "rectangle.checkered", subtext: "", text: "Pix")
                
            PaymentSections(img1: "ticket.fill", subtext: "\(1) cupom disponível", text: "Cupom")
                
            HStack{
                Text("Entrega").bold()
                Spacer()
            }.padding(.horizontal)
            PaymentSections(img1: "mappin", subtext: "Entrega em até 40 min", text: "R. Silvio da Silva")
                
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
            }label: {
                Text("Finalizar Compra")
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.blue).bold()
            }
            .cornerRadius(10)
            .padding(16)
            
            
            
        
        }.navigationTitle("Pagamento")
        
    }
}

#Preview {
    PaymentView(subtotal: 10, discount: 5, delivery: 10)
}
