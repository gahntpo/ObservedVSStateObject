//
//  AudioPlayer.swift
//  SoundDesignProject
//
//  Created by Karin Prater on 20.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//


//add AVFoundation in swift packages

import Foundation
import Combine
import AVFoundation

class Player: ObservableObject {
    
    let name: String
    let type: String
    
    private var audioPlayer = AVAudioPlayer()
    
    @Published var isPlaying: Bool = false
    
    init(name: String, type: String) {
        
       // print("initializing Player with sound file \(name)")
        self.name = name
        self.type = type
        if let url = Bundle.main.url(forResource: name, withExtension: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.prepareToPlay()
            } catch {
                print( "Could not find file: \(error.localizedDescription)")
            }
        }
    }
    
    private func pause()  {
        self.isPlaying = false
        self.audioPlayer.pause()
    }
    
    private func play()  {
        self.isPlaying = true
        self.audioPlayer.play()
    }
    
    func togglePlayer() {
        if self.isPlaying {
            self.pause()
        }else {
            self.play()
        }
    }
}
