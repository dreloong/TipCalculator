//
//  SettingsTableViewController.swift
//  TipCalculator
//
//  Created by Xiaofei Long on 12/29/15.
//  Copyright © 2015 Xiaofei Long. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var defaultTipPercentageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        let defaultTipPercentage =
            NSUserDefaults.standardUserDefaults().integerForKey("default_tip_percentage")
        defaultTipPercentageLabel.text = String(defaultTipPercentage) + "%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
