//
//  SKNode+addPhysicsBody.swift
//  
//
//  Created by Iago Ramos on 12/04/23.
//

import Foundation
import SpriteKit

extension SKNode{
    func addPhysicsBody(size: CGSize, categoryBitMask: UInt32, contactTestBitMask: UInt32){
        let body = SKPhysicsBody(rectangleOf: size)
        
        body.affectedByGravity = false
        body.allowsRotation = false
        body.categoryBitMask = categoryBitMask
        body.contactTestBitMask = contactTestBitMask
        
        self.physicsBody = body
    }
}
