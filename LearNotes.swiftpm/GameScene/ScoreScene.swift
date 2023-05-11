//
//  ScoreScene.swift
//  
//
//  Created by Iago Ramos on 19/04/23.
//

import Foundation
import SpriteKit

class ScoreScene: SKScene, ObservableObject{
    private var score = Score()
    private var noteNode: NoteComponent.NoteNode?
    
    @Published private(set) var note: NoteComponent.Note?
    
    override func sceneDidLoad() {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.3)
        self.backgroundColor = .white
        
        self.addChild(self.score.node)
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.backgroundColor = UIColor(named: "theme")!
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let roundedY = (round(touches.first!.location(in: self).y / 10) * 10) + 30
        
        if(roundedY < 10 || roundedY > 140){
            return
        }

        if(self.noteNode?.node.parent != nil){
            self.noteNode!.node.removeFromParent()
        }

        self.note = NoteComponent.Note(rawValue: roundedY)!
        self.noteNode = .init(tempo: .seminima, note: self.note!, duration: nil)
        
        self.addChild(self.noteNode!.node)
        SoundManager.shared.play(self.note!.name + (self.note!.rawValue > 70 ? "1" : "2"))
    }
}
