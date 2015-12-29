//
//  DefaultTipPercentageViewController.swift
//  TipCalculator
//
//  Created by Xiaofei Long on 12/29/15.
//  Copyright © 2015 Xiaofei Long. All rights reserved.
//

import UIKit

class DefaultTipPercentageViewController: UIViewController {

    @IBOutlet weak var tipPercentagePickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tipPercentagePickerView.dataSource = self
        tipPercentagePickerView.delegate = self

        let row = NSUserDefaults.standardUserDefaults().integerForKey("default_tip_percentage")
                - Config.TipPercentage.minValue
        tipPercentagePickerView.selectRow(row, inComponent: 0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension DefaultTipPercentageViewController: UIPickerViewDataSource {

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Config.TipPercentage.maxValue - Config.TipPercentage.minValue + 1
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

}

extension DefaultTipPercentageViewController: UIPickerViewDelegate {

    func pickerView(pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return String(Config.TipPercentage.minValue + row) + "%"
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let newPercentage = Config.TipPercentage.minValue + row
        if defaults.integerForKey("default_tip_percentage") != newPercentage {
            defaults.setInteger(newPercentage, forKey: "default_tip_percentage")
            defaults.setBool(true, forKey: "default_tip_percentage_updated")
            defaults.synchronize()
        }
    }

}
