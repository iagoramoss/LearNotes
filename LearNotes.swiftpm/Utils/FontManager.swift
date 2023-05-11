//
//  FontManager.swift
//  WWDC2023
//
//  Created by Iago Ramos on 19/04/23.
//

import Foundation
import SwiftUI

class FontManager{
    private init(){}
    
    public class func getFont(name: String, size: CGFloat) -> Font{
        let url = Bundle.main.url(forResource: name, withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(url, CTFontManagerScope.process, nil)
        
        return Font.custom(name, size: size)
    }
}
