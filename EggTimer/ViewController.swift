//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes:[String:Int]=["Soft":300,"Medium":420,"Hard":720]
    
    var secondsRemaining:Int=60
    
    var timer=Timer()
    
    @IBOutlet weak var counterLabel: UILabel!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness=sender.currentTitle!
        secondsRemaining=eggTimes[hardness]!
        
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        }
    @objc func updateTimer() {
         if secondsRemaining>0 {
             print("\(secondsRemaining) seconds.")
             secondsRemaining-=1
         }
        if secondsRemaining<=0{ counterLabel.text="DONE"}else{timer.invalidate()
            counterLabel.text="DONE!"
        }
    }
}
