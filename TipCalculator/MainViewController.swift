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

    private var numOfPeople: Int = 1 {
        didSet {
            updateLabelTexts()
        }
    }

    private var tipPercentage: Double = 0 {
        didSet {
            updateLabelTexts()
        }
    }

    override func viewDidAppear(animated: Bool) {
        if billAmountField.text!.isEmpty {
            billAmountField.becomeFirstResponder()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        inputsView.layer.borderWidth = CGFloat(1)
        inputsView.layer.borderColor = self.view.tintColor.CGColor
        resultsView.layer.borderWidth = CGFloat(1)
        resultsView.layer.borderColor = self.view.tintColor.CGColor

        numOfPeople = numOfPeopleStepper.value
        tipPercentage = 0.01 * Double(tipPercentageStepper.value)
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
        numOfPeople = numOfPeopleStepper.value
    }

    @IBAction func onTipPercentageValueChanged(sender: AnyObject) {
        tipPercentage = 0.01 * Double(tipPercentageStepper.value)
    }

    // MARK: helpers

    private func updateLabelTexts() {
        let tipAmount = billAmount * tipPercentage
        let totalAmount = billAmount + tipAmount
        tipAmountLabel.text = String(format: "%.2f", tipAmount)
        totalAmountLabel.text = String(format: "%.2f", totalAmount)
        perPersonAmountLabel.text = String(format: "%.2f", totalAmount / Double(numOfPeople))
    }

}
