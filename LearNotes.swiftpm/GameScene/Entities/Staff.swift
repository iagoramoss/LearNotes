//
//  Staff.swift
//  
//
//  Created by Iago Ramos on 31/03/23.
//

import Foundation
import SpriteKit
import GameplayKit

class Score: GKEntity{
    private(set) var node = SKNode()
    private(set) var noteComponent = NoteComponent()
    
    override init() {
        super.init()
        
        self.addComponent(LinesComponent(y: 0))
        self.addComponent(ClefComponent())
        self.addComponent(noteComponent)
        
        for component in self.components{
            if let linesComponent = component as? LinesComponent{
                self.node.addChild(linesComponent.node)
            }

            if let clefComponent = component as? ClefComponent{
                self.node.addChild(clefComponent.node)
            }

            if let noteComponent = component as? NoteComponent{
                self.node.addChild(noteComponent.node)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
