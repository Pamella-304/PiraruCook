//
//  Fonts.swift
//  PiraruCook
//
//  Created by Pamella Alvarenga on 16/05/24.
//

import SwiftUI

struct Fonts {
    static let largeTitleFont: UIFont = {
        if let customFont = UIFont(name: "Fraunces9pt-Black", size: 34) {
            return customFont
        } else {
            return UIFont.systemFont(ofSize: 34.0)
            
        }
    } ()
    
    static let title1Font: UIFont = {
        if let customFont = UIFont(name: "Fraunces9pt-Black", size: 28) {
            return customFont
        } else {
            return UIFont.systemFont(ofSize: 28.0)

        }
    } ()
    
    static let title2Font: UIFont = {
        if let customFont = UIFont(name: "Fraunces9pt-Black", size: 22) {
            return customFont
        } else {
            return UIFont.systemFont(ofSize: 22.0)

        }
    } ()
    
    static let title3Font: UIFont = {
        if let customFont = UIFont(name: "Fraunces9pt-Black", size: 20) {
            return customFont
        } else {
            return UIFont.systemFont(ofSize: 20.0)

        }
    } ()
    
    static let title4Font: UIFont = {
        if let customFont = UIFont(name: "Fraunces9pt-Black", size: 17) {
          return customFont
        } else {
          return UIFont.systemFont(ofSize: 17.0)
        }
      } ()
    
    static let headlineFont: UIFont = {
        if let customFont = UIFont(name: "Fraunces144pt-BoldItalic", size: 25) {
            return customFont
        } else {

            return UIFont.systemFont(ofSize: 25.0)
        }
    } ()
    
 
}
