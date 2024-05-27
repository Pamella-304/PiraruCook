//
//  CouponView.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 27/05/24.
//

import SwiftUI

struct CouponView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 5){
            Text("Cupons disponíveis").font(Font(Fonts.title1Font))
            Divider().padding()
        }
        ScrollView{
            Button{
               dismiss()
            }label:{
                CouponCards(couponValue: "5%", couponLabel: "off na primeira compra")
            }
            Button{
               dismiss()
            }label:{
                CouponCards(couponValue: "R$20", couponLabel: "Vitória do Caprichoso!",isCurrentCoupon: true)
            }
            
        }
    }
}

#Preview {
    CouponView()
}
