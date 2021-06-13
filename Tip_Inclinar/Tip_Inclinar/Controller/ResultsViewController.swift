//
//  ResultsViewController.swift
//  Tip_it
//
//  Created by Mr. Puneet on 6/13/21.
//

import UIKit

class ResultsViewController: UIViewController {

    var total: String = "0.0"
    var people: Int = 0
    var tipAmount: Int = 0
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = "$\(total)"
        settingsLabel.text = "Split between \(people) people, with \(tipAmount)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
