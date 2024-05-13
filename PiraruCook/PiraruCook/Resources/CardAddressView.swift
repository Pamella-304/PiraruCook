//
//  CardAddressView.swift
//  PiraruCook
//
//  Created by Breno Harris on 13/05/24.
//

import SwiftUI

struct CardAddressView: View {
    var myAddress: Address
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .stroke(.secondary, lineWidth: 1.5)
            .frame(width: 350, height: 150)
            .foregroundStyle(.secondary)
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "\(myAddress.picture)")
                            .font(.title)
                        
                        VStack(alignment: .leading) {
                            
                            HStack {
                                Text("\(myAddress.nickname)")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Spacer()
                                Image(systemName: "ellipsis")
                            }
                            
                            Text("\(myAddress.location)")
                                .fontWeight(.thin)
                        }
                        .padding()
                    }
                    
                }
                
                .foregroundStyle(.primary)
                
            }
    }
}

#Preview {
    CardAddressView(myAddress: exampleAddress.first!)
}
