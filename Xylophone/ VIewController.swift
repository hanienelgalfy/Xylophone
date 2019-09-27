//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?

class ViewController: UIViewController{
    

    @IBOutlet var collection: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       for item in collection{
        item.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.playsound(_:))))
        }
    }
    @objc func playsound(_ sender : UITapGestureRecognizer){
        
        guard let viewTag = sender.view?.tag else{
         return
        }
      
         guard let url = Bundle.main.url(forResource: "note\(viewTag)", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        
                //using tagss is left (_ sender: UIView)
        
    }
    

}

