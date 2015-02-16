//
//  SwitchTableViewCell.swift
//  Yelp
//
//  Created by Jehan Tremback on 2/16/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBAction func switchAction(sender: AnyObject) {

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
