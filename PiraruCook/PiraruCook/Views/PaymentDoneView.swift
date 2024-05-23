import SwiftUI

struct PaymentDoneView: View {
    var selectedPaymentMethod: PaymentMethods
    @State private var showTrackOrder = false

    var body: some View {
        VStack {
            switch selectedPaymentMethod {
            case .Pix:
                Text("Aguardando pagamento via Pix...")
                Image("QRCode")
                Text("291g47012m4712437g732461291g47012m4712437g732461756148738417-8471-8237291g47012m4712437g732461756148738417-8471-8237291g47012m4712437g732461756148738417-8471-8237291g47012m4712437g732461756148738417-8471-8237756148738417-8471-8237")
                    .padding(.horizontal)
            case .CreditCard:
                Text("Pagamento realizado com Cartão de Crédito.")
                Image(systemName: "creditcard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                Text("Seu pagamento foi processado com sucesso.")
                    .padding(.horizontal)
            case .ApplePay:
                Text("Pagamento realizado com Apple Pay.")
                Image(systemName: "applelogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                Text("Seu pagamento foi processado com sucesso.")
                    .padding(.horizontal)
            case .Dinheiro:
                Text("Pagamento em Dinheiro selecionado.")
                Image(systemName: "dollarsign.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                Text("Aguardando pagamento em dinheiro na entrega.")
                    .padding(.horizontal)
            }
            
            Button {
                showTrackOrder = true
            } label: {
                Text("Acompanhar Pedido")
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .bold()
                    .cornerRadius(10)
                    .padding(16)
            }
            .sheet(isPresented: $showTrackOrder) {
                TrackOrderView()
                    .environment(CartViewModel())
            }
        }
    }
}

#Preview {
    PaymentDoneView(selectedPaymentMethod: .Pix)
}
