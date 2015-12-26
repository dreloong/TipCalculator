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
    @IBOutlet weak var numOfPeopleLabel: UILabel!
    @IBOutlet weak var numOfPeopleSlider: UISlider!
    @IBOutlet weak var perPersonAmountLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageControl: UISegmentedControl!
    @IBOutlet weak var totalAmountLabel: UILabel!

    private var billAmount: Double = 0
    private var numOfPeople: Int = 1
    private var tipPercentage: Double = 0
    private var tipPercentages = [15, 20, 25]

    override func viewDidAppear(animated: Bool) {
        if billAmountField.text.isEmpty {
            billAmountField.becomeFirstResponder()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        for (index, percentage) in enumerate(tipPercentages) {
            tipPercentageControl.setTitle(String(percentage) + "%" , forSegmentAtIndex: index)
        }
        tipPercentage = 0.01 * Double(tipPercentages[tipPercentageControl.selectedSegmentIndex])
        updateLabelTexts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: actions

    @IBAction func onBillAmountFieldEditingChanged(sender: AnyObject) {
        billAmount = NSString(string: billAmountField.text).doubleValue
        updateLabelTexts()
    }

    @IBAction func onMainViewTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onNumOfPeopleSliderValueChanged(sender: AnyObject) {
        numOfPeople = Int(numOfPeopleSlider.value)
        updateLabelTexts()
    }

    @IBAction func onTipPercentageControlValueChanged(sender: AnyObject) {
        tipPercentage = 0.01 * Double(tipPercentages[tipPercentageControl.selectedSegmentIndex])
        updateLabelTexts()
    }

    // MARK: helpers

    private func updateLabelTexts() {
        let tipAmount = billAmount * tipPercentage
        let totalAmount = billAmount + tipAmount
        tipAmountLabel.text = String(format: "%.2f", tipAmount)
        totalAmountLabel.text = String(format: "%.2f", totalAmount)
        perPersonAmountLabel.text = String(format: "%.2f", totalAmount / Double(numOfPeople))
        numOfPeopleLabel.text = String(numOfPeople)
    }

}
