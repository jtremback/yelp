//
//  Filters.swift
//  Yelp
//
//  Created by Jehan Tremback on 2/15/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import Foundation
import SwiftyJSON

class Filters {
    let standardUserDefaults = NSUserDefaults.standardUserDefaults()

    let categories = [
        ["newamerican", "American (New)"],
        ["tradamerican", "American (Traditional)"],
        ["asianfusion", "Asian Fusion"],
        ["bbq", "BBQ"],
        ["brazilian", "Brazilian"],
        ["breakfast_brunch", "Breakfast & Brunch"],
        ["burmese", "Burmese"],
        ["cafes", "Cafes"],
        ["caribbean", "Caribbean"],
        ["chinese", "Chinese"],
        ["cuban", "Cuban"],
        ["delis", "Delis"],
        ["ethiopian", "Ethiopian"],
        ["hotdogs", "Fast Food"],
        ["french", "French"],
        ["gastropubs", "Gastropubs"],
        ["german", "German"],
        ["indian", "Indian"],
        ["japanese", "Japanese"],
        ["korean", "Korean"],
        ["mexican", "Mexican"],
        ["mideastern", "Middle Eastern"],
        ["pizza", "Pizza"],
        ["russian", "Russian"],
        ["sandwiches", "Sandwiches"],
        ["seafood", "Seafood"],
        ["spanish", "Spanish"],
        ["steak", "Steakhouses"],
        ["sushi", "Sushi"],
        ["taiwanese", "Taiwanese"],
        ["thai", "Thai"],
        ["vegetarian", "Vegetarian"],
        ["vietnamese", "Vietnamese"]
    ]

    let sortBy = [
        ["0", "Best Match"],
        ["1", "Distance"],
        ["2", "Highest Rated"]
    ]

    let mostPopular = [
        ["deals_filter", "Offering a Deal"]
    ]

    let distance = [
        ["auto", "Auto"],
        ["1609.34", "1 mile"],
        ["8046.72", "5 miles"],
        ["16093.4", "10 miles"],
        ["40000", "25 miles"]
    ]

    struct selected {
        let categories = [1, 4]
        let mostPopular = [0]
        let sortBy = "0"
        let distance = "auto"
    }

    var selected = [
        "Categories": [],
        "Most Popular": ["deals_filter"],
        "Sort By": "0",
        "Distance": "auto"
    ]

    init() {
        if let saved = standardUserDefaults.objectForKey(
            "selectedFilters"
        ) as? [String: NSObject] {
            self.selected = saved
        }
    }
}