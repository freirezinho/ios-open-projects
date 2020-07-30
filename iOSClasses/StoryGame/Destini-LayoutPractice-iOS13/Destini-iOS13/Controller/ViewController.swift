//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = story.title
        choice1Button.setTitle(story.choice1, for: .normal)
        choice2Button.setTitle(story.choice2, for: .normal)

    }


    @IBOutlet weak var storyLabel: UILabel!
    
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    lazy var story = storyBrain.getStory()
    
    @IBAction func choiceMade(_ sender: UIButton) {
        let title = sender.title(for: .normal)
        storyBrain.nextStory(userChoice: title!)
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.stories[storyBrain.storyIndex].title
        choice1Button.setTitle(storyBrain.stories[storyBrain.storyIndex].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.stories[storyBrain.storyIndex].choice2, for: .normal)
    }
    
}
