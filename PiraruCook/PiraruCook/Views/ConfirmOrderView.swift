import SwiftUI

struct ConfirmOrderView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(Router.self) private var stackPathPix
    @Environment(CartViewModel.self) private var viewModel

    @State var changeT = ""

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "mappin")
                Text("R. Silvio da Silva")
                .font(Font(Fonts.title4Font))

                Spacer()
                Text("até 40 min").opacity(0.6)
                .font(Font(Fonts.title4Font))

            }.padding()
            Divider().padding(.horizontal)

            HStack{
                Image(systemName: "dollarsign.circle")

                Text(viewModel.paymentMethod.rawValue)
                .font(Font(Fonts.title3Font))

                Spacer()
                Text(viewModel.displayTotalValue()).bold()
                .font(Font(Fonts.title3Font))
                
            }.padding()

            if viewModel.paymentMethod.rawValue == "Dinheiro"{
                Divider().padding(.horizontal)
                HStack{
                    Image(systemName: "dollarsign.circle")
                    Text("Troco para:")
                    TextField("Digite quanto vai pagar", text: $changeT)
                        .onChange(of: changeT) { newValue in
                            if let value = Double(newValue) {
                                viewModel.change = value
                            }
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }.padding(.horizontal)
            }
            Spacer()
            Button {
                // Lógica para finalizar o pagamento
                dismiss()
                let routerData = RouterData(screen: .PaymentDone, method: viewModel.paymentMethod)
                stackPathPix.path.append(routerData)
            } label: {

                Text("Confirmar compra")
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.brandPrimary)
                    .font(Font(Fonts.title3Font))

            }
            .cornerRadius(10)
            .padding(16)
            Spacer()
        }.navigationTitle("Confirmar Pedido")
    }
}

#Preview {
    ConfirmOrderView()
        .environment(CartViewModel())
        .environment(Router())
}
