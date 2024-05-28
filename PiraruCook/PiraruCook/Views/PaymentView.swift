

import SwiftUI

struct PaymentView: View {
    
    @State var paymentSubtitle: String = ""
    @Environment(CartViewModel.self) private var viewModel
    @State private var finalPayment = false
    
    var body: some View {
        //MARK: Payment Method
        VStack{
            HStack{
                Text("Método de pagamento")
                    .font(Font(Fonts.title3Font))
                
                Spacer()
            }.padding(.horizontal)
            
            PaymentSections(outImage: true, usage: "Método de pagamento", img1: "Pix", subtext: paymentSubtitle, text: viewModel.paymentMethod.rawValue)
                .font(Font(Fonts.title3Font))
            
            HStack{
                Spacer()
            }.padding(.horizontal)
            PaymentSections(outImage: false, usage: "Cupom", img1: "ticket.fill", subtext: "\(2) cupons disponíveis", text: "Cupom")
                .font(Font(Fonts.title3Font))
            
            
            HStack{
                Text("Entrega")
                    .font(Font(Fonts.title3Font))
                Spacer()
            }.padding(.horizontal)

            PaymentSections(outImage: false, usage: "Entrega", img1: "mappin", subtext: "Entrega em até 40 min", text: "R. Silvio da Silva")

                .font(Font(Fonts.title3Font))
            
            
            Spacer()
            HStack{
                Text("Resumo da Compra").bold()
                    .font(Font(Fonts.title3Font))
                
                Spacer()
            }.padding()
            ValuesSection(Title: "Subtotal", Price: viewModel.subTotalValue)
            
            ValuesSection(Title: "Desconto", Price: viewModel.getDiscount())
            
            
            ValuesSection(Title: "Entrega", Price: viewModel.transportationValue)
            
            
            ValuesSection(Title: "Total", Price: viewModel.getTotalValue())
                .fontWeight(.semibold)
            
            
            
            
            Button{
                // TODO: ended payment logic
                finalPayment = true
            }label: {
                Text("Finalizar Compra")
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                
                    .background(.brandPrimary)
                    .font(Font(Fonts.title3Font))
                
                
            }
            .cornerRadius(10)
            .padding(16)
            
            
        }
        .navigationTitle("Pagamento")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $finalPayment) {
            ConfirmOrderView().presentationDetents((viewModel.paymentMethod.rawValue == "Dinheiro") ? [.fraction(0.45)] : [.fraction(0.3)])
        }
        
    }
}

#Preview {
    PaymentView()
        .environment(CartViewModel())
}
