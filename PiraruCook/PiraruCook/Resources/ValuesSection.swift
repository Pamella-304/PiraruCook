//
//  ValuesSection.swift
//  PiraruCook
//
//  Created by Antonio Hoffmann on 13/05/24.
//

import SwiftUI

struct ValuesSection: View {
    var Title: String
    var Price: Int
    
    var body: some View {
        HStack{
            Text("\(Title)")
            Spacer()
            if Title == "Total"{
                ZStack{
                    Rectangle().frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.04).opacity(0.2).cornerRadius(10)
                    Text("R$ \((Price).formatted(.number.precision(.fractionLength(2))))").bold()
                }
            }else{
                Text((Title == "Desconto") ? "- R$ \((Price).formatted(.number.precision(.fractionLength(2))))" : "R$ \((Price).formatted(.number.precision(.fractionLength(2))))").opacity(0.6)
            }
        }.padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
    }
}

#Preview {
    ValuesSection(Title: "Total", Price: 10)
}
