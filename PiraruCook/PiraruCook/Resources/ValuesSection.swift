//
//  ValuesSection.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 13/05/24.
//

import SwiftUI

struct ValuesSection: View {
    var Title: String
    var Price: Double
    
    var body: some View {
        HStack{
            Text("\(Title)")
            Spacer()
            if Title == "Total"{
                Text("R$ \((Price).formatted(.number.precision(.fractionLength(2))))").bold()
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background{
                        RoundedRectangle(cornerRadius: 15)

                            .foregroundStyle(.brandSenary)
                    }
            }else{
                Text((Title == "Desconto") ? "- R$ \((Price).formatted(.number.precision(.fractionLength(2))))" : "R$ \((Price).formatted(.number.precision(.fractionLength(2))))")
            }
        }.padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
    }
}

#Preview {
    ValuesSection(Title: "Total", Price: 10)
}
