//
//  CardAddressView.swift
//  PiraruCook
//
//  Created by Breno Harris on 13/05/24.
//

import SwiftUI

struct CardAddressView: View {
    var myAddress: Address
    var isCurrentAddress = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).frame(width: 350, height: 125).foregroundColor(.white)
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .stroke(.secondary, lineWidth: isCurrentAddress ? 1.5 : 0)
                .frame(width: 350, height: 125)
                .foregroundStyle(isCurrentAddress ? .brandPrimary : .secondary)
                .overlay {
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "\(myAddress.picture)")
                                .font(.title)
                                .foregroundStyle(isCurrentAddress ? .brandPrimary : .primary)
                                .padding(.leading)
                            
                            
                            VStack(alignment: .leading) {
                                
                                HStack {
                                    Text("\(myAddress.nickname)")
                                    
                                        .font(Font(Fonts.title3Font))
                                    
                                        .foregroundStyle(isCurrentAddress ? .brandPrimary : .primary)
                                    
                                    
                                    
                                    
                                    Spacer()
                                    Image(systemName: "pencil")
                                        .foregroundStyle(isCurrentAddress ? .brandPrimary : .primary)
                                }
                                Spacer()
                                
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
}

#Preview {
    CardAddressView(myAddress: exampleAddress.first!)
}
