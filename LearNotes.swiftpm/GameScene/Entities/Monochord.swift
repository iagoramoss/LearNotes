//
//  Monochord.swift
//  
//
//  Created by Iago Ramos on 18/04/23.
//

import Foundation
import GameplayKit
import SpriteKit

class Monochord: GKEntity{
    let node = SKSpriteNode(imageNamed: "monochord")
    var bridge = SKSpriteNode(imageNamed: "bridge")
    
    override init() {
        self.node.setScale(2.3)
        super.init()
        
        self.bridge.position = CGPoint(x: 70.5, y: self.node.position.y + 6)
        self.node.addChild(self.bridge)
        
        for note in Note.allCases{
            self.node.addChild(
                NoteNode(
                    note: note,
                    y: self.node.position.y - 3,
                    bridge: self.bridge
                )
            )
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum Note: String, CaseIterable{
        case eighth
        case fifth
        case fourth
        case first
        
        var x: CGFloat{
            switch self {
            case .eighth:
                return 0
            case .fifth:
                return 30
            case .fourth:
                return 44
            case .first:
                return 70.5
            }
        }
    }
}
