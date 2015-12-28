//
//  UIStepperWithLabel.swift
//  TipCalculator
//
//  Created by Xiaofei Long on 12/27/15.
//  Copyright © 2015 Xiaofei Long. All rights reserved.
//

import UIKit

@IBDesignable class UIStepperWithLabel: UIControl {

    // MARK: properties

    @IBInspectable var maxValue: Int = 100
    @IBInspectable var minValue: Int = 0
    @IBInspectable var value: Int = 0 {
        didSet {
            value = min(maxValue, max(minValue, value))
            label.text = String(value)
            sendActionsForControlEvents(.ValueChanged)
        }
    }

    @IBInspectable var step: Int = 1
    @IBInspectable var labelWidthWeight: CGFloat = 0.8

    var label: UILabel = UILabel()
    var leftButton: UIButton = UIButton()
    var rightButton: UIButton = UIButton()

    // MARK: initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    private func initialize() {
        layer.borderColor = self.tintColor.CGColor
        layer.borderWidth = CGFloat(1)
        initializeButtons()
        initializeLabel()
    }

    private func initializeButtons() {
        for button in [leftButton, rightButton] {
            button.setTitle(button === leftButton ? "-" : "+", forState: .Normal)
            button.setTitleColor(self.tintColor, forState: .Normal)
            button.layer.borderWidth = CGFloat(1)
            button.layer.borderColor = self.tintColor.CGColor

            button.addTarget(
                self,
                action: button === leftButton
                    ? "leftButtonTouchDown:"
                    : "rightButtonTouchDown:",
                forControlEvents: UIControlEvents.TouchDown
            )

            button.addTarget(
                self,
                action: "buttonTouchUp:",
                forControlEvents: UIControlEvents.TouchUpInside
            )

            button.addTarget(
                self,
                action: "buttonTouchUp:",
                forControlEvents: UIControlEvents.TouchUpOutside
            )

            addSubview(button)
        }
    }

    private func initializeLabel() {
        label.textAlignment = .Center
        label.text = String(value)
        label.textColor = self.tintColor
        addSubview(label)
    }

    override func layoutSubviews() {
        let buttonWidth = bounds.size.width * ((1 - labelWidthWeight) / 2)
        let labelWidth = bounds.size.width * labelWidthWeight

        label.frame = CGRect(
            x: buttonWidth, y: 0,
            width: labelWidth, height: bounds.size.height
        )

        leftButton.frame = CGRect(
            x: 0, y: 0,
            width: buttonWidth, height: bounds.size.height
        )

        rightButton.frame = CGRect(
            x: buttonWidth + labelWidth, y: 0,
            width: buttonWidth, height: bounds.size.height
        )
    }

    // MARK: button actions

    func buttonTouchUp(button: UIButton) {
        leftButton.enabled = true
        rightButton.enabled = true
        label.userInteractionEnabled = true
    }

    func leftButtonTouchDown(button: UIButton) {
        rightButton.enabled = false
        label.userInteractionEnabled = false
        value -= step
    }

    func rightButtonTouchDown(button: UIButton) {
        leftButton.enabled = false
        label.userInteractionEnabled = false
        value += step
    }

}
