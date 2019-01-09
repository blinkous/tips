//
//  SettingsViewController.swift
//  tips
//
//  Created by stargaze on 1/9/19.
//  Copyright © 2019 blinkous. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultControl: UISegmentedControl!
    @IBOutlet weak var darkSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let tipValue = defaults.double(forKey: "defaultTip")
        defaultControl.selectedSegmentIndex = Int(tipValue)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeDefault(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        // Set a String value for some key.
        defaults.set(defaultControl.selectedSegmentIndex, forKey: "defaultTip")
        
        // Force UserDefaults to save.
        defaults.synchronize()
    }

    @IBAction func darkMode(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        // Set a String value for some key.
        defaults.set(darkSwitch.isOn, forKey: "defaultColor")
        // Force UserDefaults to save.
        defaults.synchronize()
        backgroundc
    }
}
