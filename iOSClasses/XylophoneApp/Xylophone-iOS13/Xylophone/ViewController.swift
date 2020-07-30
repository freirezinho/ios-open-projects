//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle!
        let dimmedAlpha = 0.5
        let normalAlpha = 1
                
        playSound(soundName: buttonTitle)

        sender.alpha = CGFloat(dimmedAlpha)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                sender.alpha = CGFloat(normalAlpha)
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
