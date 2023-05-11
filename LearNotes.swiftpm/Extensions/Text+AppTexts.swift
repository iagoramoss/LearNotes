//
//  Text+AppTexts.swift
//  
//
//  Created by Iago Ramos on 19/04/23.
//

import Foundation
import SwiftUI

extension Text{
    func title() -> Text{
        return self
            .font(FontManager.getFont(name: "ArchitectsDaughter-Regular", size: 50))
    }
    
    func text() -> some View{
        return self
            .font(FontManager.getFont(name: "Nunito-Regular", size: 18))
            .padding([.leading, .trailing], 20)
    }
}
