//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Jehan Tremback on 2/15/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    let sections = [
        "Most Popular",
        "Sort By",
        "Distance",
        "Categories"
    ]

    var sectionExpanded: Int?
    let filters = Filters()

    var categories: FilterList
    var sortBy: FilterList
    var mostPopular: FilterList
    var distance: FilterList


    required init(coder aDecoder: NSCoder) {
        self.categories = FilterList(filters: filters.categories, selected: filters.selected.categories)
        self.sortBy = FilterList(filters: filters.sortBy, selected: filters.selected.sortBy)
        self.mostPopular = FilterList(filters: filters.mostPopular, selected: filters.selected.mostPopular)
        self.distance = FilterList(filters: filters.distance, selected: filters.selected.distance)

        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath
    ) -> UITableViewCell {
        let sectionTitle = sections[indexPath.section]
        var dropdownTableViewcell: DropdownTableViewCell!
        var checkmarkTableViewcell: CheckmarkTableViewCell!

        if sectionTitle == "Most Popular" {
            cell = tableView.dequeueReusableCellWithIdentifier(
                "SwitchTableViewCell"
            ) as SwitchTableViewCell

            cell.filter = self.mostPopular.filters[indexPath.row]
            cell.titleLabel.text = cell.filter.title
        }

        else if sectionTitle == "Sort By" {
            if (self.sectionExpanded == indexPath.section) {
                cell = tableView.dequeueReusableCellWithIdentifier(
                    "CheckmarkTableViewCell"
                ) as CheckmarkTableViewCell

                cell.filter = self.sortBy.filters[indexPath.row]
                cell.titleLabel.text = cell.filter.title
            } else {
                cell = tableView.dequeueReusableCellWithIdentifier(
                    "DropdownTableViewCell"
                ) as DropdownTableViewCell

                cell.filter = self.sortBy.filters[indexPath.row]
                cell.titleLabel.text = cell.filter.title
            }
        }

        else if sectionTitle == "Distance" {
            if (self.sectionExpanded == indexPath.section) {
                cell = tableView.dequeueReusableCellWithIdentifier(
                    "CheckmarkTableViewCell"
                ) as CheckmarkTableViewCell

                cell.filter = self.distance.filters[indexPath.row]
                cell.titleLabel.text = cell.filter.title
            } else {
                cell = tableView.dequeueReusableCellWithIdentifier(
                    "DropdownTableViewCell"
                ) as DropdownTableViewCell

                cell.filter = self.distance.filters[indexPath.row]
                cell.titleLabel.text = cell.filter.title
            }
        }

        else {
            cell = tableView.dequeueReusableCellWithIdentifier(
                "CheckmarkTableViewCell"
            ) as CheckmarkTableViewCell

            cell.filter = self.categories.filters[indexPath.row]
            cell.titleLabel.text = cell.filter.title
        }

        return cell
    }

    func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if (self.sectionExpanded == section) {
            return self.sections.count
        } else {
            return 1
        }
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

