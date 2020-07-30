//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    var tip: Int = 10
    var numberOfPeople: Int = 2
    var billResult: String = "0"
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var twentyPctBtn: UIButton!
    
    @IBAction func splitStepper(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        numberOfPeopleLabel.text = String(numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToCalculate", sender: self)
    }
    
    @IBAction func tipSelected(_ sender: UIButton) {
        zeroPctBtn.isSelected = false
        tenPctBtn.isSelected = false
        twentyPctBtn.isSelected = false
        let tipPct = sender.currentTitle ?? "55"
        tip = Int(String(tipPct.dropLast(1))) ?? 0
        sender.isSelected = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfPeopleLabel.text = String(numberOfPeople)
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCalculate" {
            var bill = Bill(value: Float(String(tipTextField.text!))!, tip: tip, numberOfPeople: numberOfPeople)
            billResult = bill.Calculate()
            let resultScreen = segue.destination as! TotalViewController
            resultScreen.totalPerPerson = billResult
            resultScreen.numberOfPeople = String(numberOfPeople)
            resultScreen.tip = String(tip)
        }
    }

}

