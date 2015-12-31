//
//  ThemeColorTableViewController.swift
//  TipCalculator
//
//  Created by Xiaofei Long on 12/30/15.
//  Copyright © 2015 Xiaofei Long. All rights reserved.
//

import UIKit

class ThemeColorTableViewController: UITableViewController {

    private let themeColorNames: [String] = Array(Config.ThemeColor.optionsDict.keys).sort()
    private var checkmarkedCell: UITableViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .SingleLine
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themeColorNames.count
    }

    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "ThemeColorOptionCell",
            forIndexPath: indexPath
        )

        cell.textLabel!.text = themeColorNames[indexPath.row]
        let currentThemeColorName =
            NSUserDefaults.standardUserDefaults().stringForKey("theme_color_name")
        if (cell.textLabel!.text == currentThemeColorName) {
            checkmarkedCell = cell
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }

        return cell
    }

    // MARK: table view delegate

    override func tableView(tableView: UITableView,
                            didSelectRowAtIndexPath indexPath: NSIndexPath) {
        checkmarkedCell?.accessoryType = .None
        checkmarkedCell = tableView.cellForRowAtIndexPath(indexPath)
        checkmarkedCell?.accessoryType = .Checkmark
        NSUserDefaults.standardUserDefaults().setObject(
            checkmarkedCell?.textLabel!.text,
            forKey: "theme_color_name"
        )
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
