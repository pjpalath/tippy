//
//  ViewController.swift
//  tippy
//
//  Created by Paul Palathingal on 3/9/17.
//  Copyright © 2017 Paul Palathingal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipSegmentIndex");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        calculateTipUtil()
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    func calculateTipUtil() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = NSLocale.current
        
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        totalLabel.text = formatter.string(from: NSNumber(value: total))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipSegmentIndex");
        calculateTipUtil()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipSegmentIndex");
        calculateTipUtil()
    }
}
