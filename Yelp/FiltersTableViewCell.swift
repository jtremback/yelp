//
//  FiltersTableViewCell.swift
//  Yelp
//
//  Created by Jehan Tremback on 2/15/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

enum FiltersTableViewCellType {
    case Switch, Dropdown, Checkmark
}

class FiltersTableViewCell: UITableViewCell {
    var filter: Filter!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!

    @IBAction func switchAction(sender: AnyObject) {
        filter.toggleSelected()
        switchOutlet.selected = !switchOutlet.selected
    }

    func populate () {
        titleLabel.text = filter.title
        switchOutlet.selected = filter.selected
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
