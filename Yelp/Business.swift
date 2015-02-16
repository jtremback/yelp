//
//  Business.swift
//  Yelp
//
//  Created by Jehan Tremback on 2/15/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import Foundation
import SwiftyJSON

class Business {
    let name: String
    let snapshotImageUrl: NSURL

    let starsImageUrl: NSURL
    let numberReviews: Int
    let address: String
    let categories: [String]

    init (
        json: JSON
    ) {
        name = json["name"].stringValue
        snapshotImageUrl = NSURL(string: json["image_url"].stringValue)!

        starsImageUrl = NSURL(string: json["rating_img_url_large"].stringValue)!
        numberReviews = json["review_count"].intValue
        address = json["location"]["address"][0].stringValue
        if let array = json["categories"].arrayObject {
            categories = map(array) {
                (item: AnyObject) -> String in
                return item[0] as String
            }
        } else {
            categories = []
        }
    }
}
