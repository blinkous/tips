//
//  ViewController.swift
//  tips
//
//  Created by stargaze on 1/7/19.
//  Copyright © 2019 blinkous. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the focus automatically to the billField so that the keyboard
        // appears automatically
        self.billField.becomeFirstResponder()
    }

    // Making the keyboard disappear when you tap elsewhere on the screen
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    // Resetting all of the fields for the clear button
    @IBAction func clearField(_ sender: Any) {
        billField.text = ""
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    // Calculating the tip and total and displaying it
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        // Casting the billField text as a double and setting bill = to it
        // If there is something other than a number in there, set bill to 0
        let bill = Double(billField.text!) ?? 0
        
        // Finding the tip and totals using the segmented control to set the tip
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Setting the labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

