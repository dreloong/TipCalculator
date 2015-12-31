//
//  MainViewController.swift
//  TipCalculator
//
//  Created by Xiaofei Long on 12/26/15.
//  Copyright (c) 2015 Xiaofei Long. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var inputsView: UIView!
    @IBOutlet weak var numOfPeopleStepper: UIStepperWithLabel!
    @IBOutlet weak var perPersonAmountLabel: UILabel!
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageStepper: UIStepperWithLabel!
    @IBOutlet weak var totalAmountLabel: UILabel!

    private var billAmount: Double = 0 {
        didSet {
            updateLabelTexts()
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if billAmountField.text!.isEmpty {
            billAmountField.becomeFirstResponder()
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        let defaults = NSUserDefaults.standardUserDefaults()
        if defaults.boolForKey("default_tip_percentage_updated") {
            tipPercentageStepper.value = defaults.integerForKey("default_tip_percentage")
            defaults.setBool(false, forKey: "default_tip_percentage_updated")
            defaults.synchronize()
            updateLabelTexts()
        }

        updateThemeColor()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        inputsView.layer.borderWidth = CGFloat(1)
        resultsView.layer.borderWidth = CGFloat(1)

        tipPercentageStepper.value =
            NSUserDefaults.standardUserDefaults().integerForKey("default_tip_percentage")
        updateLabelTexts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: actions

    @IBAction func onBillAmountFieldEditingChanged(sender: AnyObject) {
        billAmount = NSString(string: billAmountField.text!).doubleValue
    }

    @IBAction func onMainViewTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onNumOfPeopleValueChanged(sender: AnyObject) {
        updateLabelTexts()
    }

    @IBAction func onTipPercentageValueChanged(sender: AnyObject) {
        updateLabelTexts()
    }

    // MARK: helpers

    private func updateLabelTexts() {
        let tipAmount = billAmount * Double(tipPercentageStepper.value) * 0.01
        let totalAmount = billAmount + tipAmount
        tipAmountLabel.text = String(format: "%.2f", tipAmount)
        totalAmountLabel.text = String(format: "%.2f", totalAmount)
        perPersonAmountLabel.text =
            String(format: "%.2f", totalAmount / Double(numOfPeopleStepper.value))
    }

    private func updateThemeColor() {
        let themeColor = Config.ThemeColor.optionsDict[
            NSUserDefaults.standardUserDefaults().stringForKey("theme_color_name")!
        ]

        inputsView.layer.borderColor = themeColor?.CGColor
        resultsView.layer.borderColor = themeColor?.CGColor

        numOfPeopleStepper.updateColors(themeColor!)
        tipPercentageStepper.updateColors(themeColor!)
    }

}
