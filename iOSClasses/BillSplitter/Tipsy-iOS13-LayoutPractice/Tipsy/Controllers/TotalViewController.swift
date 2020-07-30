//
//  TotalViewController.swift
//  Tipsy
//
//  Created by mac on 08/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class TotalViewController: UIViewController {
    
    var totalPerPerson: String = "0.0"
    var numberOfPeople: String = "0"
    var tip: String = "0"
    @IBOutlet weak var amountForEach: UILabel!
    @IBOutlet weak var criteriaText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountForEach.text = totalPerPerson
        criteriaText.text = "Split between \(numberOfPeople), with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
