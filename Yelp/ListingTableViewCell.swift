//
//  ListingTableViewCell.swift
//  Yelp
//
//  Created by Jehan Tremback on 2/15/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class ListingTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var snapshotImage: UIImageView!

    @IBOutlet weak var starsImage: UIImageView!
    @IBOutlet weak var numberReviewsLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!

//    @IBOutlet weak var distanceLabel: UILabel!
//    @IBOutlet weak var priceLabel: UILabel!

    func populate (business: Business) {
        titleLabel.text = business.name

        snapshotImage.alpha = 0.0
        snapshotImage.setImageWithURL(business.snapshotImageUrl)
        UIView.animateWithDuration(0.2, animations: {
            self.snapshotImage.alpha = 1.0
        })

        starsImage.setImageWithURL(business.starsImageUrl)
        numberReviewsLabel.text = "\(business.numberReviews) reviews"
        addressLabel.text = business.address
        categoriesLabel.text = ", ".join(business.categories)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        snapshotImage.layer.cornerRadius = 5
        snapshotImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
