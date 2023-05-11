//
//  MonochordView.swift
//  WWDC2023
//
//  Created by Iago Ramos on 18/04/23.
//

import SwiftUI
import SpriteKit

struct MonochordView: View {
    @State var scene = MonochordScene()
    
    var body: some View {
        ZStack{
            Color("theme")
                .ignoresSafeArea()
            
            VStack{
                Text("Monochord")
                    .title()
                    .padding(.top, -20)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading){
                    Text("The study of notes began with Pythagoras of Samos, in ancient Greece, who studied notes on a single-stringed instrument, the monochord.")
                        .text()
                    
                    
                    Text("Pythagoras divided the string into ratios of 1/2, 2/3, and 3/4, discovering a relationship between the length of the string and the sound produced.")
                        .text()
                        .padding(.top, 10)
                    
                    Text("This is the monochord, tap the circles to split the string and tap \"Play\" to hear the sound:")
                        .text()
                        .padding(.top, 10)
                    
                    
                    SpriteView(scene: scene)
                        .frame(height: 200)
                    
                }
                
                HStack{
                    Button {
                        SoundManager.shared.play(self.scene.selectedNote)
                    } label: {
                        ContinueButton(text: "Play")
                    }
                    
                    NavigationLink(destination: ScoreView()) {
                        ContinueButton(text: "Continue")
                    }
                }
            }
        }
        .onAppear{
            self.scene.scaleMode = .resizeFill
        }
    }
}

struct MonochordView_Previews: PreviewProvider {
    static var previews: some View {
        MonochordView()
    }
}
