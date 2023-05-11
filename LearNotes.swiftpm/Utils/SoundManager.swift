//
//  SoundManager.swift
//  WWDC2023
//
//  Created by Iago Ramos on 15/04/23.
//

import Foundation
import AVFoundation

class SoundManager{
    static let shared = SoundManager()
    private var player: AVAudioPlayer?
    
    private init(){}
    
    func play(_ name: String){
        let url = Bundle.main.url(forResource: name, withExtension: "MP3")!
        
        do{
            self.player = try AVAudioPlayer(contentsOf: url)
            self.player?.play()
        } catch{
            fatalError("Error while playing sound: \(error)")
        }
    }
}
