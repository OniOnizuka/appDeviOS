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
    
   
    

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4,"Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        playSound(soundName: sender.currentTitle)
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        // Soft, Medium, Hard
        
        totalTime = eggTimes[hardness]!

        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func playSound(soundName: String?){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
          
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float (totalTime)
           
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
    }
   }

    

}
