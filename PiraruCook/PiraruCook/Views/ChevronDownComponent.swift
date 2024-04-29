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
        HStack(){
            Text("\(displayName)").font(.title2)
            Spacer()
            Button {
                hasClicked.toggle()
            } label: {
                Image(systemName: (hasClicked ? "chevron.down" : "chevron.right"))
            }
        }
        
        
        if hasClicked {
            VStack {
                ForEach(array, id: \.self) {
                    Text($0)
                }
            }
            .padding()
        }
            
    }
}

//#Preview {
//    ChevronDownComponent()
//}
