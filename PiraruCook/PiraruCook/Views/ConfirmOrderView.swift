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
                Spacer()
                Text("até 40 min").opacity(0.6)
            }.padding()
            Divider().padding(.horizontal)

            HStack{
                Image(systemName: "dollarsign.circle")

                Text(viewModel.paymentMethod.rawValue)
                Spacer()
                Text(viewModel.displayTotalValue()).bold()
                
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

                Text("Confirmar Pedido")
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.brandPrimary).bold()
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
}
