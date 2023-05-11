//
//  Monochord+NoteNode.swift
//  
//
//  Created by Iago Ramos on 19/04/23.
//

import Foundation
import SpriteKit

extension Monochord{
    class NoteNode: SKShapeNode{
        private let bridge: SKSpriteNode
        private let note: Monochord.Note
        
        init(note: Monochord.Note, y: CGFloat, bridge: SKSpriteNode) {
            self.bridge = bridge
            self.note = note
            
            super.init()
            
            let circle = SKShapeNode(circleOfRadius: 5)
            
            self.path = circle.path
            self.strokeColor = .black
            self.fillColor = .black
            self.position = CGPoint(x: note.x, y: y)
            self.isUserInteractionEnabled = true
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.bridge.run(.moveTo(x: self.position.x, duration: 0.5))
            (self.scene! as! MonochordScene).selectedNote = self.note.rawValue
        }
    }

}
