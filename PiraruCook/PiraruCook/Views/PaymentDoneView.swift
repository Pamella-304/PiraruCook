//
//  PaymentDoneView.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 13/05/24.
//

import SwiftUI

struct PaymentDoneView: View {
    var body: some View {
        VStack{
            Text("Aguardando pagamento...")
            Image("QRCode")
            
        }
    }
}

#Preview {
    PaymentDoneView()
}
