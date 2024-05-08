//
//  CartView.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//
import SwiftUI

struct CartView: View {
    
    @Environment(Router.self) private var stackPathCart
    @Environment(Cart.self) private var cart
    @State var viewModel = CartViewModel()
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                Section {
                    if let items = viewModel.cart?.items {
                        if !items.isEmpty {
                            ForEach(items) { item in
                                CartItemView(dish: item)
                            }
                        }
                    }
                }
            }
            
            VStack(spacing:16) {
                
                // MARK: Cupom section
                HStack {
                    Image(systemName: "ticket.fill")
                    VStack(alignment: .leading) {
                        Text("Cupom")
                            .bold()
                        // TODO: Retrive number of cupons
                        Text("\(1) cupons disponíveis")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Button {
                        // TODO: Goto CupomView()
                    } label: {
                        Text("Ver")
                            .bold()
                    }
                }
                .padding(.horizontal)
                
                
                // MARK: Payment Resume
                VStack(spacing:16) {
                    HStack {
                        Text("Subtotal")
                        Spacer()
                        Text("R$\((viewModel.cart?.subTotalValue ?? 0).formatted(.number.precision(.fractionLength(2))))")
                    }
                    
                    VStack {
                        HStack {
                            Text("Entrega")
                            Spacer()
                            Picker(selection: $viewModel.isDelivery, label: Text("Opção de entrega")) {
                                Text("Entrega").tag(true)
                                Text("Retirar no local").tag(false)
                            }
                            .onChange(of: viewModel.isDelivery) { oldValue, newValue in
                                viewModel.cart?.setTransportation(cost: newValue ? 5.0 : 0.0)
                            }
                        }
                        
                        Text("R$\((viewModel.cart?.transportationValue ?? 0).formatted(.number.precision(.fractionLength(2))))")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    HStack {
                        Text("Total")
                        Spacer()
                        Text("R$\((viewModel.cart?.getTotalValue() ?? 0).formatted(.number.precision(.fractionLength(2))))")
                    }
                }
                .padding(.horizontal)
                
                // MARK: Payment
                Button{
                    // TODO: payment logic
                    stackPathCart.path.append(RouterData(screen: .Payment))
                }label: {
                    Text("Pagamento")
                        .foregroundColor(.white)
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                }
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                
            }
            
        }
        .navigationTitle("Carrinho")
        .onAppear {
            self.viewModel.setup(self.cart)
        }
    }
}

#Preview {
    CartView()
        .environment(Cart())
}
