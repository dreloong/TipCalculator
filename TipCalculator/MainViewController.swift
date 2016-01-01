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

    @IBOutlet var staticLabels: [UILabel]!

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
        }

        setThemeColor(Config.ThemeColor.optionsDict[defaults.stringForKey("theme_color_name")!]!)
        updateLabelTexts()
        updateLightDarkMode()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tipPercentageStepper.value =
            NSUserDefaults.standardUserDefaults().integerForKey("default_tip_percentage")
        setBorderWidth(Config.borderWidth)
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

    private func setBackgroundColor(color: UIColor) {
        view.backgroundColor = color
        inputsView.backgroundColor = color
        resultsView.backgroundColor = color
        numOfPeopleStepper.backgroundColor = color
        tipPercentageStepper.backgroundColor = color
    }

    private func setBorderWidth(width: CGFloat) {
        inputsView.layer.borderWidth = width
        resultsView.layer.borderWidth = width
        numOfPeopleStepper.setBorderWidth(width)
        tipPercentageStepper.setBorderWidth(width)
    }

    private func setTextColor(color: UIColor) {
        for label in staticLabels {
            label.textColor = color
        }

        billAmountField.textColor = color
        perPersonAmountLabel.textColor = color
        tipAmountLabel.textColor = color
        totalAmountLabel.textColor = color
    }

    private func setThemeColor(color: UIColor) {
        inputsView.layer.borderColor = color.CGColor
        resultsView.layer.borderColor = color.CGColor

        numOfPeopleStepper.setThemeColor(color)
        tipPercentageStepper.setThemeColor(color)
    }

    private func updateLabelTexts() {
        let tipAmount = billAmount * Double(tipPercentageStepper.value) * 0.01
        let totalAmount = billAmount + tipAmount
        tipAmountLabel.text = String(format: "%.2f", tipAmount)
        totalAmountLabel.text = String(format: "%.2f", totalAmount)
        perPersonAmountLabel.text =
            String(format: "%.2f", totalAmount / Double(numOfPeopleStepper.value))
    }

    private func updateLightDarkMode() {
        if (NSUserDefaults.standardUserDefaults().boolForKey("dark_mode_selected")) {
            billAmountField.backgroundColor = Config.TextFieldBackgroundColor.darkModeColor
            billAmountField.keyboardAppearance = .Dark
            setBackgroundColor(Config.BackgroundColor.darkModeColor)
            setTextColor(Config.TextColor.darkModeColor)
        } else {
            billAmountField.backgroundColor = Config.TextFieldBackgroundColor.lightModeColor
            billAmountField.keyboardAppearance = .Light
            setBackgroundColor(Config.BackgroundColor.lightModeColor)
            setTextColor(Config.TextColor.lightModeColor)
        }
    }

}
