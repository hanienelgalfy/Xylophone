//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var collection: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       for item in collection{
        item.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playsound)))
       }
    }
    @objc func playsound(){
        //using tagss is left (_ sender: UIView)
        print("hi")
    }
    

}

