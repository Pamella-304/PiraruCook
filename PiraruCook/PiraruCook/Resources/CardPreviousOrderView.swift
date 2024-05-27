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
        
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                
                VStack(alignment: .leading) {
                    ForEach(0..<previousOrder.items.count, id: \.self) {
                        
                        if $0 == 2 {
                            Text("\(previousOrder.qtyPerItem[$0])x \(previousOrder.items[$0]) \(previousOrder.items.count > 3 ? "..." : "")")
                                .font(Font(Fonts.title4Font))
                                .foregroundStyle(.brandSecondary)
                        } else if $0 < 2 {
                            Text("\(previousOrder.qtyPerItem[$0])x \(previousOrder.items[$0])")
                                .font(Font(Fonts.title4Font))
                                .foregroundStyle(.brandSecondary)
                        }

                    }
                    
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 8) {
                    
                    Text("R$ \(previousOrder.price.formatted(.number.precision(.fractionLength(2))))")
                        .font(Font(Fonts.title3Font))
                        .foregroundStyle(.brandSecondary)
                    
                    Text(previousOrder.date, format: Date.FormatStyle().day(.twoDigits).month(.twoDigits).year())
                        .fontWeight(.thin)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            Spacer()
            
            Text(previousOrder.address)
                .font(.footnote)
                .foregroundStyle(.brandSecondary)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .frame(height: 140, alignment: .leading)
        .background(.white)
        .cornerRadius(15)
        
        
        
        //        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
        //            .stroke(.secondary, lineWidth: 1.5)
        //            .frame(width: 350, height: 150)
        //            .foregroundStyle(.secondary)
        //            .overlay {
        //                VStack {
        //                    HStack(alignment: .top) {
        //                        VStack(alignment: .leading) {
        //                            ForEach(0..<previousOrder.items.count, id: \.self) {
        //                                Text("\(previousOrder.qtyPerItem[$0])x ")
        //                                    .fontWeight(.light) +
        //                                Text("\(previousOrder.items[$0])")
        //
        //                            }
        //
        //                        }
        //
        //                        Spacer()
        //                        VStack {
        //                            Text("R$ \(previousOrder.price.formatted(.number.precision(.fractionLength(2))))")
        //                                .fontWeight(.regular)
        //                            Text("\(previousOrder.date.formatted(.dateTime.day().month().year()))")
        //                                .fontWeight(.thin)
        //                        }
        //
        //                    }
        //                    .padding(8)
        //                    //                        Spacer()
        //                    HStack {
        //                        Text("\(previousOrder.address)")
        //                            .fontWeight(.light)
        //                        Spacer()
        //                    }
        //                    .padding(8)
        //                }
        //                .foregroundStyle(.primary)
        //
        //            }
        //            .background(.quinary)
    }
}

#Preview {
    CardPreviousOrderView(previousOrder: previousOrderExample.last!)
}
