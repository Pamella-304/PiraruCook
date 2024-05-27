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
            .stroke(.brandSecondary, lineWidth: 3)
            .frame(width: 350, height: 70)
            .foregroundStyle(isCurrentCoupon ? .brandPrimary : .brandSecondary)
            .overlay {
                HStack{
                    Text(couponValue).font(Font(Fonts.title1Font)).foregroundStyle(.brandPrimary)
                    Spacer()
                    Text(couponLabel).font(Font(Fonts.title3Font)).foregroundStyle(.brandSecondary)
                }.padding()
            }
    }
}

#Preview {
    CouponCards(couponValue: "5%", couponLabel: "off na primeira compra")
}
