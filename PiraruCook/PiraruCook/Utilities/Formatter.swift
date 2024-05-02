//
//  Formatter.swift
//  PiraruCook
//
//  Created by Breno Harris on 02/05/24.
//

import Foundation

extension String {
    func TrimAndUpperCase() -> String? {
        
        var temp =  self.trimmingCharacters(in: .whitespaces)
        var temp1 = temp.first?.uppercased()
        var temp2 = temp.dropFirst().lowercased()
        if temp1 != nil {
            return temp1! + temp2
        }
        return nil
    }
    
}
