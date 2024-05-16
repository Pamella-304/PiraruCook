//
//  Fonts.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 16/05/24.
//

import SwiftUI

struct Fonts {
    static let largeTitleFont: Font = {
        if let customFont = UIFont(name: "Fraunces_9pt-Black", size: 34) {
            return Font(customFont)
        } else {
            return Font.largeTitle
            
        }
    } ()
    
    static let title1Font: Font = {
        if let customFont = UIFont(name: "Fraunces_9pt-Black", size: 28) {
            return Font(customFont)
        } else {
            return Font.largeTitle

        }
    } ()
    
    static let title2Font: Font = {
        if let customFont = UIFont(name: "Fraunces_9pt-Black", size: 22) {
            return Font(customFont)
        } else {
            return Font.largeTitle

        }
    } ()
    
    static let title3Font: Font = {
        if let customFont = UIFont(name: "Fraunces_9pt-Black", size: 20) {
            return Font(customFont)
        } else {
            return Font.largeTitle

        }
    } ()
    
    static let headlineFont: Font = {
        if let customFont = UIFont(name: "Fraunces_9pt-BoldItalic", size: 20) {
            return Font(customFont)
        } else {
            return Font.largeTitle

        }
    } ()
    
    
}
