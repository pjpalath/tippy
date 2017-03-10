//
//  SettingsViewController.swift
//  tippy
//
//  Created by Paul Palathingal on 3/10/17.
//  Copyright © 2017 Paul Palathingal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipSegmentIndex");
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func valueChanged(_ sender: Any) {
    
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tipSegmentIndex")
    }
}
