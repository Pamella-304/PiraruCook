//
//  PaymentView.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 13/05/24.
//

import SwiftUI

struct PaymentView: View {

    @State var paymentSubtitle: String = ""
    @Environment(CartViewModel.self) private var viewModel
    @State private var finalPayment = false
   
    
    var body: some View {
        //MARK: Payment Method
        VStack{
            HStack{
                Text("Forma de Pagamento").bold()
                Spacer()
            }.padding(.horizontal)
            
            PaymentSections(usage: "Método de pagamento", img1: "rectangle.checkered", subtext: paymentSubtitle, text: viewModel.paymentMethod.rawValue)
                
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
            ValuesSection(Title: "Subtotal", Price: viewModel.subTotalValue)
            ValuesSection(Title: "Desconto", Price: viewModel.getDiscount())
            ValuesSection(Title: "Entrega", Price: viewModel.transportationValue)
            ValuesSection(Title: "Total", Price: viewModel.getTotalValue())
            
            
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
    PaymentView()
        .environment(CartViewModel())
}
