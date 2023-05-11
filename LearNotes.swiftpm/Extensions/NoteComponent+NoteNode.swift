//
//  NoteComponent+NoteNode.swift
//  
//
//  Created by Iago Ramos on 07/04/23.
//

import Foundation
import SpriteKit

extension NoteComponent{
    class NoteNode{
        var node = SKNode()
        
        var note: Note
        var size: CGSize!
        
        init(tempo: Tempo?, note: Note?, duration: CGFloat?) {
            let tempo = tempo ?? Tempo.allCases.randomElement()!
            self.note = note ?? Note.allCases.randomElement()!
            
            let invert = self.note.rawValue >= 70
            let (imageNamed, nodeScale, errorMargin, linePosition) = self.getTempoConfigs(tempo, invert)
            
            let noteNode = self.createNoteNode(self.note, imageNamed, nodeScale, errorMargin, invert)
            self.node.addChild(noteNode)
            self.size = noteNode.size
            
            switch self.note{
            case .c1, .a2, .b2:
                self.node.addChild(self.createLineNode(self.note, linePosition))
                
            default:
                break
            }
            
            guard duration != nil else{
                return
            }
            
            self.node.position.x = (UIScreen.main.bounds.width / 2)
            self.node.run(.moveTo(x: UIScreen.main.bounds.width / -2, duration: duration!))
        }
        
        private func getTempoConfigs(_ tempo: Tempo, _ invert: Bool) -> (String, CGFloat, CGFloat, [CGFloat]){
            var nodeScale: CGFloat
            var errorMargin: CGFloat
            var linePosition: [CGFloat]
            
            var imageNamed: String{
                let name = tempo.rawValue
                
                if(!invert){
                    return name
                }
                
                if(tempo == .minima || tempo == .seminima){
                    return name
                }
                
                return "inverted-\(name)"
            }
            
            switch tempo {
            case .semicolcheia:
                nodeScale = 0.05
                errorMargin = 3
                
                linePosition = invert ? [1.6, 1.5] : [2, 1]
                
            case .colcheia:
                nodeScale = 0.08
                errorMargin = 3.5
                
                linePosition = invert ? [1.5, 1.6] : [2, 0.9]
                
            case .seminima:
                nodeScale = 0.1
                errorMargin = invert ? -6.5 : 6
                
                linePosition = invert ? [1.6, 1.8] : [1.7, 1.6]
                
            case .minima:
                nodeScale = 0.16
                errorMargin = invert ? -5 : 6.5
                
                linePosition = invert ? [1.5, 1.8] : [1.7, 1.5]
            }
            
            return (imageNamed, nodeScale, errorMargin, linePosition)
        }
        
        private func createNoteNode(_ note: Note, _ imageNamed: String, _ nodeScale: CGFloat, _ errorMargin: CGFloat, _ invert: Bool) -> SKSpriteNode{
            let noteNode = SKSpriteNode(imageNamed: imageNamed)
            
            noteNode.anchorPoint = CGPoint(x: 0.5, y: invert ? -0.22 : 0.5)
            noteNode.setScale(nodeScale * (invert ? -1 : 1))
            noteNode.position = CGPoint(x: 0, y: note.rawValue - errorMargin)
            
            noteNode.addPhysicsBody(
                size: CGSize(
                    width: noteNode.size.width / 4,
                    height: noteNode.size.height
                ),
                categoryBitMask: 1,
                contactTestBitMask: 2
            )
            
            return noteNode
        }
        
        private func createLineNode(_ note: Note, _ linePosition: [CGFloat]) -> SKShapeNode{
            let y: CGFloat = note == .c1 ? -20 : 100
            
            let line = LinesComponent.createLine(x1: linePosition[0] * -15, x2: linePosition[1] * 15, y: y)
            line.zPosition = -1
            
            return line
        }
    }
}
