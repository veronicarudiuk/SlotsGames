//
//  AudioManager.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 27/12/2022.
//

import AVFoundation

final class AudioManager {
    
    private var player = AVAudioPlayer()
    
    func playSound(soundName: String?) {
        stopPlay()
        
        guard let path = Bundle.main.path(forResource: soundName, ofType:"mp3") else {
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopPlay() {
        player.stop()
    }
}
