//
//  NoteComponent+Note.swift
//  
//
//  Created by Iago Ramos on 07/04/23.
//

import Foundation   

extension NoteComponent{
    enum Note: CGFloat, CaseIterable{
        case c1 = 10
        case d1 = 20
        case e1 = 30
        case f1 = 40
        case g1 = 50
        case a1 = 60
        case b1 = 70
        case c2 = 80
        case d2 = 90
        case e2 = 100
        case f2 = 110
        case g2 = 120
        case a2 = 130
        case b2 = 140
        
        var name: String{
            switch self{
            case .c1, .c2:
                return "c"
                
            case .d1, .d2:
                return "d"
                
            case .e1, .e2:
                return "e"
                
            case .f1, .f2:
                return "f"
                
            case .g1, .g2:
                return "g"
                
            case .a1, .a2:
                return "a"
                
            case .b1, .b2:
                return "b"
            }
        }
    }
}
