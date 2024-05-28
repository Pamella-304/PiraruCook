//
//  CouponCards.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 27/05/24.
//

import SwiftUI

struct CouponCards: View {
    var couponValue: String
    var couponLabel: String
    var isCurrentCoupon = false
    
    var body: some View {
        
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .stroke(isCurrentCoupon ? .brandPrimary : .clear, lineWidth: 3)
            .frame(height: 70)
            
            .overlay {
                HStack(spacing:16){
                    Text(couponValue).font(Font(Fonts.title1Font)).foregroundStyle(.brandPrimary)
                    Text(couponLabel).font(Font(Fonts.title3Font)).foregroundStyle(.brandSecondary)
                }
                .padding(8)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
            .padding(.bottom, 16)
    }
}

#Preview {
    CouponCards(couponValue: "5%", couponLabel: "off na primeira compra")
}
