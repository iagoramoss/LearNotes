//
//  NoteComponent.swift
//  
//
//  Created by Iago Ramos on 03/04/23.
//

import Foundation
import GameplayKit
import SpriteKit

class NoteComponent: GKComponent{
    private(set) var node = SKNode()
    private(set) var note: Note?
    
    var speed: CGFloat = 5
    
    override init() {
        super.init()
        
        self.node.name = "note"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func spawnNote(){
        let noteNode = NoteNode(tempo: nil, note: nil, duration: self.speed)
        
        self.note = noteNode.note
        
        self.node.removeAllChildren()
        self.node.addChild(noteNode.node)
    }
}
