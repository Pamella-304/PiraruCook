//
//  CardPaymentMethodView.swift
//  PiraruCook
//
//  Created by Breno Harris on 13/05/24.
//

import SwiftUI

struct CardPaymentMethodView: View {
    var symbol: String
    var description: [String]
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .stroke(.secondary, lineWidth: 1.5)
            .frame(width: 125, height: 125)
            .foregroundStyle(.tertiary)
            .overlay {
                VStack(alignment: .leading) {
                    Image(systemName: "\(symbol)")
                        .foregroundStyle(.blue)
                        .font(.title2)
                    Spacer()
                    Text("\(description.first ?? "")")
                        .font(.caption2)
                    
                    Text("\(description[1])")
                        .font(.caption)
                }
                .font(.body)
                .padding()
                
            }
            .background(.quinary)
    }
}

//#Preview {
//    CardPaymentMethodView()
//}
