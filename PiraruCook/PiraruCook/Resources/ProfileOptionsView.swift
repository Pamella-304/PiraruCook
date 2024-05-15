//
//  ProfileOptionsView.swift
//  PiraruCook
//
//  Created by Breno Harris on 08/05/24.
//

import SwiftUI

struct ProfileOptionsView: View {
    var imageName: String
    var title: String
    var description: String

    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                Image(systemName: "\(imageName)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text("\(title)")
                        .font(.title3)
                    Text("\(description)")
                        .font(.footnote)
                        .fontWeight(.thin)
                }
                Spacer()
            }
            .padding(.horizontal, 36)
            Divider()
                .padding(.horizontal, 16)
        }
    }
}
//
//#Preview {
//    ProfileOptionsView()
//}
