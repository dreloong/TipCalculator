//
//  Config.swift
//  TipCalculator
//
//  Created by Xiaofei Long on 12/30/15.
//  Copyright © 2015 Xiaofei Long. All rights reserved.
//

import Foundation
import UIKit

struct Config {

    static let darkModeInitSelected = false
    static let borderWidth: CGFloat = 2

    struct BackgroundColor {
        static let darkModeColor = UIColor(white: 0.2, alpha: 1.0)
        static let lightModeColor = UIColor.whiteColor()
    }

    struct TextColor {
        static let darkModeColor = UIColor.whiteColor()
        static let lightModeColor = UIColor(white: 0.2, alpha: 1.0)
    }

    struct TextFieldBackgroundColor {
        static let darkModeColor = UIColor(white: 0.3, alpha: 1.0)
        static let lightModeColor = UIColor(white: 0.95, alpha: 1.0)
    }

    struct TipPercentage {
        static let maxValue = 99
        static let minValue = 0
        static let initValue = 18
    }

    struct ThemeColor {
        static let initOptionKey = "Blue"
        static let optionsDict = [
            "Blue": UIColor(red: 0.2, green: 0.6, blue: 0.86, alpha: 1.0),
            "Green": UIColor(red: 0.1, green: 0.74, blue: 0.61, alpha: 1.0),
            "Purple": UIColor(red: 0.56, green: 0.27, blue: 0.68, alpha: 1.0),
            "Red": UIColor(red: 0.91, green: 0.3, blue: 0.24, alpha: 1.0)
        ]
    }

}
