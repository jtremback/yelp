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
        "Most Popular",
        "Sort By",
        "Distance",
        "Categories"
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

//    func createTableViewCell (type: String, title: String) {
//        switch type {
//            case "SwitchTableViewCell":
//
//        }
//    }

    func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath
    ) -> UITableViewCell {
        let sectionTitle = sections[indexPath.section]

        switch sectionTitle {
            case "Most Popular":
                let title = filters.mostPopular[indexPath.row]
                let cell = tableView.dequeueReusableCellWithIdentifier(
                    "SwitchTableViewCell"
                ) as SwitchTableViewCell

                cell.titleLabel.text = title
                cell.switchOutlet.fuckYou = filters.selected[]
                
            case "Sort By":
                let title = filters.sortBy[indexPath.row]
                if (self.sectionExpanded == indexPath.section) {
                    let cell = tableView.dequeueReusableCellWithIdentifier(
                        "CheckmarkTableViewCell"
                    ) as CheckmarkTableViewCell

                    cell.titleLabel.text = title
                } else {
                    let cell = tableView.dequeueReusableCellWithIdentifier(
                        "DropdownTableViewCell"
                    ) as DropdownTableViewCell

                    cell.titleLabel.text = title
                }

            case "Distance":
                let title = filters.distance[indexPath.row]
                if (self.sectionExpanded == indexPath.section) {
                    let cell = tableView.dequeueReusableCellWithIdentifier(
                        "CheckmarkTableViewCell"
                    ) as CheckmarkTableViewCell

                    cell.titleLabel.text = title
                } else {
                    let cell = tableView.dequeueReusableCellWithIdentifier(
                        "DropdownTableViewCell"
                    ) as DropdownTableViewCell

                    cell.titleLabel.text = title
                }

            case "Categories":
                let title = filters.categories[indexPath.row]
                let cell = tableView.dequeueReusableCellWithIdentifier(
                    "CheckmarkTableViewCell"
                ) as CheckmarkTableViewCell
        }
    }

    func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if (self.sectionExpanded == section) {
            return filters.lists[sections[section]].count
        } else { return 1 }
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

