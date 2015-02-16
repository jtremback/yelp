//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Jehan Tremback on 2/15/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FiltersViewController:
UIViewController,
UITableViewDataSource,
UITableViewDelegate {
    @IBOutlet weak var filtersTableView: UITableView!

    let sections = [
        "deals",
        "sortBy",
        "distance",
        "categories"
    ]

    var sectionExpanded: Int?
    var filters = Filters()

    override func viewDidLoad() {
        super.viewDidLoad()
        filtersTableView.delegate = self
        filtersTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath
    ) -> UITableViewCell {
        switch sections[indexPath.section] {
            case "deals":
                let cell = tableView.dequeueReusableCellWithIdentifier(
                    "SwitchTableViewCell"
                ) as SwitchTableViewCell
            case "sortBy":
                if (self.sectionExpanded == indexPath.section) {
                    let cell = tableView.dequeueReusableCellWithIdentifier(
                        "CheckmarkTableViewCell"
                    ) as CheckmarkTableViewCell
                } else {
                    let cell = tableView.dequeueReusableCellWithIdentifier(
                        "DropdownTableViewCell"
                    ) as DropdownTableViewCell
                    
                    cell.titleLabel.text = "Sort By"
                }
        }
    }

    func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch sections[section] {
            case "deals":
                return 1
            case "sortBy":
                if (self.sectionExpanded == section) {
                    return filters.sortBy.count
                } else { return 1 }
            case 2:
                if (self.sectionExpanded == section) {
                    return filters.sortBy.count
                } else { return 1 }
            case 3:
                if (self.sectionExpanded == section) {
                    return filters.distance.count
                } else { return 1 }
            default:
                return 0
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

