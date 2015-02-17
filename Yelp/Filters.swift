//
//  Filters.swift
//  Yelp
//
//  Created by Jehan Tremback on 2/15/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Filters {
    let categories = [
        "newamerican": "American (New)",
        "tradamerican": "American (Traditional)",
        "asianfusion": "Asian Fusion",
        "bbq": "BBQ",
        "brazilian": "Brazilian",
        "breakfast_brunch": "Breakfast & Brunch",
        "burmese": "Burmese",
        "cafes": "Cafes",
        "caribbean": "Caribbean",
        "chinese": "Chinese",
        "cuban": "Cuban",
        "delis": "Delis",
        "ethiopian": "Ethiopian",
        "hotdogs": "Fast Food",
        "french": "French",
        "gastropubs": "Gastropubs",
        "german": "German",
        "indian": "Indian",
        "japanese": "Japanese",
        "korean": "Korean",
        "mexican": "Mexican",
        "mideastern": "Middle Eastern",
        "pizza": "Pizza",
        "russian": "Russian",
        "sandwiches": "Sandwiches",
        "seafood": "Seafood",
        "spanish": "Spanish",
        "steak": "Steakhouses",
        "sushi": "Sushi",
        "taiwanese": "Taiwanese",
        "thai": "Thai",
        "vegetarian": "Vegetarian",
        "vietnamese": "Vietnamese"
    ]
    
    let sortBy = [
        "0": "Best Match",
        "1": "Distance",
        "2": "Highest Rated"
    ]
    
    let mostPopular = [
        "deals_filter": "Offering a Deal"
    ]
    
    let distance = [
        "auto": "Auto",
        "1609.34": "1 mile",
        "8046.72": "5 miles",
        "16093.4": "10 miles",
        "40000": "25 miles"
    ]

    var selected = (
        categories: ["newamerican", "korean"],
        mostPopular: [""],
        sortBy: ["0"],
        distance: ["auto"]
    )
}

class FilterList {
    var filters: [Filter] = []
    
    init (filters: [String: String], selected: [String]) {
        for (key, title) in filters {
            var filter = Filter(key: key, title: title)
            for select in selected {
                if select == key {
                    filter.selected = true
                }
            }

            self.filters.append(filter)
        }
    }
}

class Filter {
    var key, title: String!
    var selected: Bool!
    
    init(key: String, title: String) {
        self.key = key
        self.title = title
        selected = false
    }
    
    func toggleSelected() {
        selected = !selected
    }
}

