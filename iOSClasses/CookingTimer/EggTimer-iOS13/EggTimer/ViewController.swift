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
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    var eggTimes = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player : AVAudioPlayer!
    
    @IBOutlet weak var eggsLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        eggsLabel.attributedText = NSAttributedString(string: "How do you like your eggs?")
        progressBar.progress = 0.0
        totalTime = 0
        secondsPassed = 0
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        //        Option 3
        //        print(eggTimes[hardness]!)

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)


        //        Option 2
        /*
         switch hardness {
         case "Soft":
         print(softTime)
         case "Medium":
         print(mediumTime)
         case "Hard":
         print(hardTime)
         default:
         print("Hardness not evaluated")
         }
         */

        //         Option 1
        /*
         if hardness == "Soft" {
         print(softTime)
         } else if hardness == "Medium" {
         print(mediumTime)
         } else {
         print(hardTime)
         }
         */
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = Float(percentageProgress)
        } else {
            timer.invalidate()
            eggsLabel.attributedText = NSAttributedString(string: "Done!")
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
            player.play()
        }
        
    }
    
    
}
