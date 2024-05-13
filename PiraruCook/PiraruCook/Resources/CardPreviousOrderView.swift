//
//  CardPreviousOrderView.swift
//  PiraruCook
//
//  Created by Breno Harris on 10/05/24.
//

import SwiftUI

struct CardPreviousOrderView: View {
    var previousOrder: PreviousOrder
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .stroke(.secondary, lineWidth: 1.5)
            .frame(width: 350, height: 150)
            .foregroundStyle(.secondary)
            .overlay {
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            ForEach(0..<previousOrder.items.count, id: \.self) {
                                Text("\(previousOrder.qtyPerItem[$0])x ")
                                    .fontWeight(.light) +
                                Text("\(previousOrder.items[$0])")
                                
                            }
                            
                        }
                        
                        Spacer()
                        VStack {
                            Text("R$ \(previousOrder.price.formatted(.number.precision(.fractionLength(2))))")
                                .fontWeight(.regular)
                            Text("\(previousOrder.date.formatted(.dateTime.day().month().year()))")
                                .fontWeight(.thin)
                        }
                        
                    }
                    .padding(8)
                    //                        Spacer()
                    HStack {
                        Text("\(previousOrder.address)")
                            .fontWeight(.light)
                        Spacer()
                    }
                    .padding(8)
                }
                .foregroundStyle(.primary)
                
            }
    }
}

#Preview {
    CardPreviousOrderView(previousOrder: previousOrderExample.first!)
}
