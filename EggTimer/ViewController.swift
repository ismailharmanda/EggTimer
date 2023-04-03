//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer!
    
    
    func playAlarm(){
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
        let url=Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player=try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    let eggTimes:[String:Int]=["Soft":300,"Medium":420,"Hard":720]
    var timer=Timer()
    var totalTime=0
    var secondsPassed=0
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        player?.stop()
        let hardness=sender.currentTitle!
        progressBar.progress=0
        secondsPassed=0
        counterLabel.text=hardness
        timer.invalidate()
        totalTime=eggTimes[hardness]!
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        secondsPassed+=1
        let percentageProgress=Float(secondsPassed)/Float(totalTime)
        progressBar.progress=percentageProgress
        if secondsPassed>=totalTime {
            timer.invalidate()
            counterLabel.text="DONE!"
            playAlarm()
        }
    }
}
