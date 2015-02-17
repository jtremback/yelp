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

//class FiltersTableViewCell: UITableViewCell {
//    var filter: Filter!
//    
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var switchOutlet: UISwitch!
//    @IBAction func switchAction(sender: AnyObject) {
//        
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//        
//    func populate () {
//        
//    }
//}

class FiltersTableViewCell: UITableViewCell {
    var filter: Filter!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

//class DropdownTableViewCell: UITableViewCell {
//    var filter: Filter!
//
//    @IBOutlet weak var titleLabel: UILabel!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//}
//
//class CheckmarkTableViewCell: UITableViewCell {
//    var filter: Filter!
//
//    @IBOutlet weak var titleLabel: UILabel!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//}

