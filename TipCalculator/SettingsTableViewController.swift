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
    @IBOutlet weak var themeColorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        let defaults = NSUserDefaults.standardUserDefaults()
        defaultTipPercentageLabel.text =
            String(defaults.integerForKey("default_tip_percentage")) + "%"
        themeColorLabel.text = defaults.stringForKey("theme_color_name")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
