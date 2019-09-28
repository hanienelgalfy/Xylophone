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
        item.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.notePressed(_:))))
        }
    }
    @objc func notePressed(_ sender : UITapGestureRecognizer){
        
        guard let viewTag = sender.view?.tag else{
         return
        }
        playsound(viewTag: viewTag)
      
        
     
    }
    func playsound(viewTag : Int){
        guard let url = Bundle.main.url(forResource: "note\(viewTag)", withExtension: "wav") else { return }
               
               do {
                   try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                   try AVAudioSession.sharedInstance().setActive(true)
                    
                   player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue) //the player is like a radio and we enter the CD in it which is the url
                 
                   
                   guard let player = player else { return }
                   
                   player.play()
                   
               } catch let error {
                   print(error.localizedDescription)
               }
    }


}

