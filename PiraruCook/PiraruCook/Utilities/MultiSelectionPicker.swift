//
//  MultiSelectionPicker.swift
//  PiraruCook
//
//  Created by Breno Harris on 21/05/24.
//



// para ser usado caso a queira implementar o picker multiplode opcoes de prato. Pequenas alteracoes devem ser feitas nessa classe para que ela funcione propriamente

import Foundation
import SwiftUI

struct MultiSelectionPicker<LabelView: View, Selectable: Identifiable & Hashable>: View {
    
    let label: LabelView
    let options: [Selectable]
    
    let optionToString: (Selectable) -> String
    
    var selected: Binding<Set<Selectable>>
    
    
    private var formattedSelectedListString: String {
            ListFormatter.localizedString(byJoining: selected.wrappedValue.map { optionToString($0) })
        }

        var body: some View {
            NavigationLink(destination: multiSelectionView()) {
                HStack {
                    label
                    Spacer()
                    Text(formattedSelectedListString)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                }
            }
        }

    private func multiSelectionView() -> some View {
        Text("TODO: add multi selection detail view here")
    }
    
    
}


struct MultiSelectionPicker_Previews: PreviewProvider {
    struct IdentifiableString: Identifiable, Hashable {
        let string: String
        var id: String { string }
    }
  
    @State
    static var selected: Set<IdentifiableString> = Set(["B", "C"].map { IdentifiableString(string: $0) })
    
    static var previews: some View {
        NavigationView {
            Form {
                MultiSelectionPicker<Text, IdentifiableString>(
                    label: Text("Multiselect"),
                    options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
                    optionToString: { $0.string },
                    selected: $selected
                )
            }.navigationTitle("Title")
        }
    }
}
