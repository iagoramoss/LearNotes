import SwiftUI
import SpriteKit
import WrappingStack

struct GameView: View {
    @StateObject var scene = GameScene()
    
    @State var isPaused = true
    @State var pauseButtonText = "Start"
    
    let notes = ["c", "e", "g", "b", "d", "f", "a"]

    var body: some View {
        ZStack{
            Color("theme")
                .ignoresSafeArea()
            
            VStack{
                Text("Game")
                    .title()
                
                Text("And here's a little game for you to exercise and have fun! Random notes will appear on the score, and you have to guess what they are by pressing the buttons. But watch out, as time goes by, the difficulty will increase!")
                    .text()
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 10)
                
                SpriteView(scene: scene)
                    .frame(height: 200)
                
                HStack(spacing: 16){
                    Text("Hits: \(self.scene.hits)")
                        .text()

                    Text("Fails: \(self.scene.fails)")
                        .text()
                }
                .padding(.top, -50)
                
                WrappingHStack(id: \.self, horizontalSpacing: 40){
                    ForEach(notes, id: \.self) { note in
                        Button {
                            self.scene.guessNote(note: note)
                        } label: {
                            ZStack{
                                Circle()
                                    .fill(Color("noteButtonColor"))
                                    .frame(width: 50, height: 50)
                                
                                Text(note.uppercased())
                                    .font(FontManager.getFont(name: "Nunito-SemiBold", size: 18))
                                    .foregroundColor(Color("theme"))
                            }
                        }
                        .disabled(self.isPaused)
                    }
                }
                
                HStack{
                    if(self.isPaused && self.pauseButtonText != "Start"){
                        Button {
                            self.scene.reset()
                            
                            withAnimation {
                                self.pauseButtonText = "Start"
                            }
                        } label: {
                            ContinueButton(text: "Reset")
                        }
                    }
                    
                    Button {
                        self.isPaused.toggle()
                    } label: {
                        ContinueButton(text: pauseButtonText)
                    }
                }
                .padding(.top, 70)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .onAppear{
                self.scene.scaleMode = .resizeFill
            }
            .onChange(of: self.isPaused) { isPaused in
                if(!isPaused && self.pauseButtonText == "Start"){
                    self.scene.start()
                }
                
                self.scene.isPaused = isPaused
                self.pauseButtonText = isPaused ? "Resume" : "Pause"
            }
        }
    }
}
