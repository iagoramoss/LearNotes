//
//  GameScene.swift
//  
//
//  Created by Iago Ramos on 31/03/23.
//

import Foundation
import SpriteKit
import AVKit
import AVFoundation

class GameScene: SKScene, ObservableObject, SKPhysicsContactDelegate{
    private(set) var score = Score()
    
    @Published private(set) var hits: Int = 0
    @Published private(set) var fails: Int = 0
    
    var player: AVAudioPlayer?
    
    override func sceneDidLoad() {
        self.physicsWorld.contactDelegate = self
        self.anchorPoint = .init(x: 0.5, y: 0.3)
        
        self.addChild(self.score.node)
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.backgroundColor = UIColor(named: "theme")!
    }
    
    func start(){
        self.score.noteComponent.spawnNote()
    }
    
    func reset(){
        self.score.node.removeAllActions()
        self.score.node.removeAllChildren()
        
        self.removeAllActions()
        self.removeAllChildren()
        
        self.hits = 0
        self.fails = 0
        
        self.score = Score()
        self.addChild(self.score.node)
    }
    
    public func guessNote(note: String){
        self.playNoteSound()
        
        let hit = self.score.noteComponent.note?.name == note

        self.score.noteComponent.node.removeAllChildren()
        self.score.noteComponent.spawnNote()

        if(hit){
            self.hits += 1
            self.score.noteComponent.speed -= self.score.noteComponent.speed > 2 ? 0.1 : 0

            return
        }

        self.fails += 1
    }
    
    func playNoteSound(){
        let note = self.score.noteComponent.note!
        SoundManager.shared.play(note.name + (note.rawValue > 70 ? "1" : "2"))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        self.guessNote(note: "")
    }
}
