//
//  CardAddressView.swift
//  PiraruCook
//
//  Created by Breno Harris on 13/05/24.
//

import SwiftUI

struct CardAddressView: View {
    @Binding var myAddress: Address
    var isCurrentAddress = false
    @Binding var isEditing: Bool
    var myIndex = 0
    @Binding var editingAddress: Int?
    
    @Binding var editingAddressName: String
    @Binding var editingAddressLocation: String
    @Binding var editingAddressPicture: String
    
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .stroke(.secondary, lineWidth: 1.5)
            .frame(width: 350, height: 125)
            .foregroundStyle(isCurrentAddress ? .brandPrimary : .secondary)
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "\(myAddress.picture)")
                            .font(.title)
                            .foregroundStyle(isCurrentAddress ? .brandPrimary : .primary)
                        
                        
                        VStack(alignment: .leading) {

                            HStack {
                                Text("\(myAddress.nickname)")
                                
                                    .font(Font(Fonts.title3Font))
                                
                                    .foregroundStyle(isCurrentAddress ? .brandPrimary : .primary)
                                
                                
                                
                                
                                Spacer()
                                
                                Button {
                                    isEditing.toggle()
                                    EditAddressPlaceHolder()
                                    editingAddress = myIndex
                                } label: {
                                    Image(systemName: "pencil")
                                        .foregroundStyle(isCurrentAddress ? .brandPrimary : .primary)
                                }
                                
                                
                            }
                            Spacer()
                                Text("\(myAddress.location)")
                                    .fontWeight(.thin)
                            
                            
                        }.padding()
                    }
                    .foregroundStyle(.primary)
                }
            }
    }
    func EditAddressPlaceHolder() {
        editingAddressName = myAddress.nickname
        editingAddressLocation = myAddress.location
        editingAddressPicture = myAddress.picture
    }
}

//#Preview {
//    CardAddressView(myAddress: exampleAddress.first!, allAddresses: )
//}
