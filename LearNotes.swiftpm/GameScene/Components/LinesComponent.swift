//
//  LinesComponent.swift
//  
//
//  Created by Iago Ramos on 31/03/23.
//

import Foundation
import GameplayKit
import SpriteKit

class LinesComponent: GKComponent{
    private(set) var node = SKNode()
    
    init(y: Int) {
        super.init()
        
        for i in 0..<5{
            self.node.addChild(LinesComponent.createLine(x1: nil, x2: nil, y: CGFloat(y + (i * 20))))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public class func createLine(x1: CGFloat?, x2: CGFloat?, y: CGFloat) -> SKShapeNode{
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: x1 ?? (UIScreen.main.bounds.width / -2), y: y))
        path.addLine(to: CGPoint(x: x2 ?? (UIScreen.main.bounds.width / 2), y: y))
        
        let line = SKShapeNode(path: path)
        
        line.strokeColor = .black
        line.lineWidth = 1
        
        return line
    }
}

