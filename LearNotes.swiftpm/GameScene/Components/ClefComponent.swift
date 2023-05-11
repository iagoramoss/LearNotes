//
//  ClefComponent.swift
//  
//
//  Created by Iago Ramos on 03/04/23.
//

import Foundation
import GameplayKit
import SpriteKit

class ClefComponent: GKComponent{
    private(set) var node: SKSpriteNode
    
    override init() {
        self.node = SKSpriteNode(imageNamed: "G-Clef")
        
        self.node.name = "clef"
        self.node.position = CGPoint(x: (UIScreen.main.bounds.width / -2) + 50, y: 35)
        self.node.setScale(2)
        
        self.node.addPhysicsBody(size: self.node.size, categoryBitMask: 2, contactTestBitMask: 1)
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
