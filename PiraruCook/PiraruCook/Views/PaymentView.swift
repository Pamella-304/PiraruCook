

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
                    .font(Font(Fonts.title2Font))

                Spacer()
            }.padding(.horizontal)
            
            PaymentSections(usage: "Método de pagamento", img1: "rectangle.checkered", subtext: paymentSubtitle, text: viewModel.paymentMethod.rawValue)
                .font(Font(Fonts.title3Font))

            HStack{
//                Text("Desconto").bold()
                Spacer()
            }.padding(.horizontal)
            PaymentSections(usage: "", img1: "ticket.fill", subtext: "\(1) cupom disponível", text: "Cupom")
                .font(Font(Fonts.title3Font))

                
            HStack{
                Text("Entrega").bold()
                    .font(Font(Fonts.title2Font))
                Spacer()
            }.padding(.horizontal)
            PaymentSections(usage: "", img1: "mappin", subtext: "Entrega em até 40 min", text: "R. Silvio da Silva")
                .font(Font(Fonts.title3Font))

                
            Spacer()
            HStack{
                Text("Resumo da Compra").bold()
                .font(Font(Fonts.title2Font))

                Spacer()
            }.padding()
            ValuesSection(Title: "Subtotal", Price: viewModel.subTotalValue)
                .font(Font(Fonts.title4Font))
            ValuesSection(Title: "Desconto", Price: viewModel.getDiscount())
                .font(Font(Fonts.title4Font))

            ValuesSection(Title: "Entrega", Price: viewModel.transportationValue)
                .font(Font(Fonts.title4Font))

            ValuesSection(Title: "Total", Price: viewModel.getTotalValue())
                .font(Font(Fonts.title4Font))


            
            
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
            
        
        }.navigationTitle("Pagamento").sheet(isPresented: $finalPayment) {
            ConfirmOrderView().presentationDetents((viewModel.paymentMethod.rawValue == "Dinheiro") ? [.fraction(0.45)] : [.fraction(0.3)])
        }
        
    }
}

#Preview {
    PaymentView()
        .environment(CartViewModel())
}
