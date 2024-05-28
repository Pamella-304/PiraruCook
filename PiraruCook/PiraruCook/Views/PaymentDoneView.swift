import SwiftUI

struct PaymentDoneView: View {
    var selectedPaymentMethod: PaymentMethods
    @State private var showTrackOrder = false

    var body: some View {
        VStack {
            
            Group {
                switch selectedPaymentMethod {
                case .Pix:
                    Text("Aguardando pagamento via Pix...")
                        .font(Font(Fonts.title3Font))
                    
                    Image("QRCode")
                    Text("291g47012m4712437g732461291g47012m4712437g732461756148738417-8471-8237291g47012m4712437g732461756148738417-8471-8237291g47012m4712437g732461756148738417-8471-8237291g47012m4712437g732461756148738417-8471-8237756148738417-8471-8237")
                        .padding(.horizontal)
                case .CreditCard:
                    VStack(spacing: 16){
                        Text("Pagamento com Cartão de Crédito.")
                        
                        Image(systemName: "creditcard")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        Text("Processado com sucesso.")
                            
                    }
                    .font(Font(Fonts.title3Font))
                case .ApplePay:
                    
                    VStack(spacing: 16){
                        Text("Pagamento com Apple Pay.")
                        
                        Image(systemName: "applelogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        Text("Processado com sucesso.")
                            
                    }
                    .font(Font(Fonts.title3Font))

                case .Dinheiro:
                    
                    VStack(spacing: 16){
                        Text("Pagamento com Dinheiro.")
                        
                        Image(systemName: "dollarsign.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        Text("Processado com sucesso.")
                            
                    }
                    .font(Font(Fonts.title3Font))
                    
                }
            }
            .padding(.horizontal)
            
            Button {
                showTrackOrder = true
            } label: {
                Text("Acompanhar Pedido")
                    .foregroundColor(.white)
                    .font(Font(Fonts.title3Font))
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.brandPrimary)
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
