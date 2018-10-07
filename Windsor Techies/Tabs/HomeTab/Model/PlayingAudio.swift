//
//  PlayingAudio.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-23.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import Foundation
import AVFoundation

class PlayingAudio: NSObject, AVAudioPlayerDelegate {
   
    class func play(){
        
        do {
            let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: "xxxx", ofType: "mp3")!) as URL
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            
                audioPlayer.play()
            
        } catch {
            print("Error")
        }
    }
    
}
