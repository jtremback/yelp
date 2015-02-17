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
        self.categories = FilterList(
            filters: filters.categories,
            title: "Categories",
            selected: filters.selected.categories
        )
        self.sortBy = FilterList(
            filters: filters.sortBy,
            title: "Sort By",
            selected: filters.selected.sortBy
        )
        self.mostPopular = FilterList(
            filters: filters.mostPopular,
            title: "Most Popular",
            selected: filters.selected.mostPopular
        )
        self.distance = FilterList(
            filters: filters.distance,
            title: "Distance",
            selected: filters.selected.distance
        )

        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let cancelButton = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Cancel,
            target: self,
            action: "cancelFilters"
        )
        
        let searchButton = UIBarButtonItem(
            title: "Search",
            style: UIBarButtonItemStyle.Bordered,
            target: self,
            action: "acceptFilters"
        )
        
        cancelButton.setTitleTextAttributes(
            [NSForegroundColorAttributeName: UIColor.whiteColor()],
            forState: UIControlState.Normal
        )
        
        searchButton.setTitleTextAttributes(
            [NSForegroundColorAttributeName: UIColor.whiteColor()],
            forState: UIControlState.Normal
        )
        
        self.navigationItem.rightBarButtonItem = searchButton
        self.navigationItem.leftBarButtonItem = cancelButton
    }

    func acceptFilters () {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func cancelFilters () {
        navigationController?.popToRootViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getFilterListForIndex (index: Int) -> FilterList {
        switch index {
            case 0:
                return self.mostPopular
            case 1:
                return self.sortBy
            case 2:
                return self.distance
            default:
                return self.categories
        }
    }

    func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "FiltersTableViewCell"
        ) as FiltersTableViewCell

        cell.filter = getFilterListForIndex(
            indexPath.section
        ).filters[indexPath.row]
        
        cell.populate()
        return cell
    }

    func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return getFilterListForIndex(section).filters.count
    }

    func tableView(
        tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        return getFilterListForIndex(
            section
        ).title
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

