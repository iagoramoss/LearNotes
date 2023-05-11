//
//  MonochordScene.swift
//  
//
//  Created by Iago Ramos on 18/04/23.
//

import Foundation
import SpriteKit

class MonochordScene: SKScene{
    private(set) var monochord = Monochord()
    var selectedNote: String = "first"
    
    override func sceneDidLoad() {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addChild(monochord.node)
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.backgroundColor = UIColor(named: "theme")!
    }
}
