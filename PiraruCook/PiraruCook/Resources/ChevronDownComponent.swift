//
//  ChevronDownComponent.swift
//  PiraruCook
//
//  Created by Breno Harris on 26/04/24.
//

import SwiftUI

struct ChevronDownComponent: View {
    var displayName: String
    @Binding var hasClicked: Bool
    var array: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Button {
                withAnimation(.easeInOut(duration: 0.25)) {
                    hasClicked.toggle()
                }
                
            } label: {
                HStack {
                    Text("\(displayName)")
                        .font(Font(Fonts.title3Font))
                        .foregroundStyle(.black)
                    Spacer()
                    Image(systemName: ("chevron.right"))
                        .foregroundStyle(.black)
                        .rotationEffect(.degrees(hasClicked ? 90 : 0))
                }
                
            }
            
            
            if hasClicked {
                VStack(alignment: .leading) {
                    ForEach(array, id: \.self) {
                        Text("•\($0.TrimAndUpperCase() ?? "")")
                            .font(.body)
                    }
                }
                .padding()
            }
        }
        
        
    }
}

//#Preview {
//    ChevronDownComponent()
//}
