//
//  ViewController.swift
//  Tip_it
//
//  Created by Mr. Puneet on 6/12/21.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var fivePercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var tip = 0.0
    var numberOfPeople = 0
    var final_result = "0.0"
    var totalBill = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.attributedPlaceholder = NSAttributedString(string: "e.g. 123.56", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Deselect all the buttons initially
        fivePercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        
        sender.isSelected = true
        
        let tipSelected = sender.currentTitle!
        let tipAmount = String((tipSelected.dropLast()))
        let tipTitle = Double(tipAmount)!
        tip = tipTitle/100
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // default tip value selected is 10%
        if tip == 0.0{
            tip = 0.10
        }
        // default stepper value is 2
        if numberOfPeople == 0{
            numberOfPeople = 2
        }
        let billAmount = billTextField.text!
        if billAmount != ""{
            totalBill = Double(billAmount)!
            let result = (totalBill * (1 + tip)) / Double(numberOfPeople)
            final_result = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = final_result
            destinationVC.people = numberOfPeople
            destinationVC.tipAmount = Int(tip * 100)
        }
    }
}
