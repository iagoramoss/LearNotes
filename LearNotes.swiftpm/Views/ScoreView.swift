//
//  ScoreView.swift
//  WWDC2023
//
//  Created by Iago Ramos on 19/04/23.
//

import Foundation
import SwiftUI
import SpriteKit

struct ScoreView: View {
    @StateObject var scene = ScoreScene()
    @State var note = ""
    
    var body: some View {
        ZStack{
            Color("theme")
                .ignoresSafeArea()
            
            VStack{
                Text("Score")
                    .title()
                    .padding(.top, -20)
                    .padding(.bottom, 20)
                
                Text("Centuries later, the Italian Guido of Arezzo created the musical notes, which today we know as \"Do, Re, Mi, Fa, Sol, La, Si\", or, \"C, D, E, F, G, A, B\".")
                .text()
                
                Text("At the same time, the score was created, which can tell us the pitch and tempo of the written music.")
                    .text()
                    .padding(.top, 10)
                    .padding([.leading, .trailing], -10)
                
                Text("Each note in the score can be on a line or in a space. Play the lines and spaces, observe and listen to what notes are created:")
                    .text()
                    .padding(.top, 10)
                
                SpriteView(scene: scene)
                    .frame(height: 200)
                
                Text("Note:  \(self.note)")
                    .font(FontManager.getFont(name: "Nunito-SemiBold", size: 18))
                    .padding(.top, -40)
                
                NavigationLink(destination: GameView()) {
                    ContinueButton(text: "Continue")
                }
            }
        }
        .onAppear{
            self.scene.scaleMode = .resizeFill
        }
        .onChange(of: self.scene.note) { note in
            let convert = [
                "C": "Do",
                "D": "Re",
                "E": "Mi",
                "F": "Fa",
                "G": "Sol",
                "A": "La",
                "B": "Si"
            ]
            
            self.note = "\(convert[note!.name.uppercased()]!) / \(note!.name.uppercased())"
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
