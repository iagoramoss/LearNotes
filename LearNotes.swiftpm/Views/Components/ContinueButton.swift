//
//  ContinueButton.swift
//  WWDC2023
//
//  Created by Iago Ramos on 19/04/23.
//

import SwiftUI

struct ContinueButton: View {
    let text: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 50)
                .fill(Color("continueButtonColor"))
                .frame(width: 150, height: 50)
            
            Text(text)
                .font(FontManager.getFont(name: "Nunito-Regular", size: 18))
                .foregroundColor(.black)
        }
    }
}
