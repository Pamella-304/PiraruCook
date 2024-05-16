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
            Text("291g47012m4712437g732461291g47012m4712437g732461756148738417-8471-8237291g47012m4712437g732461756148738417-8471-8237291g47012m4712437g732461756148738417-8471-8237291g47012m4712437g732461756148738417-8471-8237291g47012m4712437g732461756148738417-8471-8237756148738417-8471-8237").padding(.horizontal)
            
        }
    }
}

#Preview {
    PaymentDoneView()
}
