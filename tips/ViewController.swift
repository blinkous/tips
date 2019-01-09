//
//  ViewController.swift
//  tips
//
//  Created by stargaze on 1/7/19.
//  Copyright © 2019 blinkous. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipTextLabel: UILabel!
    @IBOutlet weak var totalTextLabel: UILabel!
    @IBOutlet weak var splitTextLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var splitTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the focus automatically to the billField so that the keyboard
        // appears automatically
        self.billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Setting segmented control to defaults
        let defaults = UserDefaults.standard
        let tipValue = defaults.double(forKey: "defaultTip")
        tipControl.selectedSegmentIndex = Int(tipValue)
        
        // Updating the fields to match the tip percent
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
        
        // Updating dark or light mode
        let darkMode = defaults.bool(forKey: "darkMode")
        
        if (darkMode) {
            //Setting the colors for this view
            self.view.backgroundColor = UIColor.black
            tipTextLabel.textColor = UIColor.white
            totalTextLabel.textColor = UIColor.white
            tipLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            billField.textColor = UIColor.white
            splitField.textColor = UIColor.white
            splitTotalLabel.textColor = UIColor.white
            splitTextLabel.textColor = UIColor.white
            billField.attributedPlaceholder = NSAttributedString(string: "$",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            splitField.attributedPlaceholder = NSAttributedString(string: "1",
                                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
        else {
            //Setting the colors for this view
            self.view.backgroundColor = UIColor.white
            tipTextLabel.textColor = UIColor.black
            totalTextLabel.textColor = UIColor.black
            tipLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            billField.textColor = UIColor.black
            splitField.textColor = UIColor.black
            splitTotalLabel.textColor = UIColor.black
            splitTextLabel.textColor = UIColor.black
            splitField.attributedPlaceholder = NSAttributedString(string: "1",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        }
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
        splitTotalLabel.text = "$0.00"
    }
    

    @IBAction func splitChange(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        // Casting the billField text as a double and setting bill = to it
        // If there is something other than a number in there, set bill to 0
        let bill = Double(billField.text!) ?? 0
        let split = Double(splitField.text!) ?? 1
        
        // Finding the tip and totals using the segmented control to set the tip
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip)/split
        
        // Setting the labels
        splitTotalLabel.text = String(format: "$%.2f", total)
    }
    
    // Calculating the tip and total and displaying it
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        // Casting the billField text as a double and setting bill = to it
        // If there is something other than a number in there, set bill to 0
        let bill = Double(billField.text!) ?? 0
        let split = Double(splitField.text!) ?? 1
        
        // Finding the tip and totals using the segmented control to set the tip
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let splitTotal = (bill + tip)/split
        
        // Setting the labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitTotalLabel.text = String(format: "$%.2f", splitTotal)
    }
}

