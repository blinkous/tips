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
    @IBOutlet weak var darkSwitchLabel: UILabel!
    @IBOutlet weak var defaultTipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let tipValue = defaults.double(forKey: "defaultTip")
        defaultControl.selectedSegmentIndex = Int(tipValue)
        let darkMode = defaults.bool(forKey: "darkMode")
        darkSwitch.isOn = darkMode
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        
        // Updating dark or light mode
        let darkMode = defaults.bool(forKey: "darkMode")
        
        if (darkMode) {
            //Setting the colors for this view
            self.view.backgroundColor = UIColor.black
            defaultTipLabel.textColor = UIColor.white
            darkSwitchLabel.textColor = UIColor.white
        }
        else {
            //Setting the colors for this view
            self.view.backgroundColor = UIColor.white
            defaultTipLabel.textColor = UIColor.black
            darkSwitchLabel.textColor = UIColor.black
        }
    }
    
    @IBAction func changeDefault(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultControl.selectedSegmentIndex, forKey: "defaultTip")
        // Force UserDefaults to save.
        defaults.synchronize()
    }

    @IBAction func darkMode(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(darkSwitch.isOn, forKey: "darkMode")
        // Force UserDefaults to save.
        defaults.synchronize()
        
        if (darkSwitch.isOn) {
            //Setting the colors for this view
            self.view.backgroundColor = UIColor.black
            defaultTipLabel.textColor = UIColor.white
            darkSwitchLabel.textColor = UIColor.white
        }
        else {
            //Setting the colors for this view
            self.view.backgroundColor = UIColor.white
            defaultTipLabel.textColor = UIColor.black
            darkSwitchLabel.textColor = UIColor.black
        }
    }
}
