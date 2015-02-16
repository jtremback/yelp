//
//  ListingViewController.swift
//  Yelp
//
//  Created by Jehan Tremback on 2/15/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
import SwiftyJSON

class ListingViewController:
UIViewController,
UITableViewDataSource,
UITableViewDelegate,
UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!

    var json: JSON!
    var businesses: JSON!
    var client: YelpClient!

    var searchBar: UISearchBar!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120

        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 260, height: 20))
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        navigationItem.titleView = searchBar

        let filterButton = UIBarButtonItem(
            title: "Filter",
            style: UIBarButtonItemStyle.Bordered,
            target: self,
            action: "goToFilter"
        )

        filterButton.setTitleTextAttributes(
            [NSForegroundColorAttributeName: UIColor.whiteColor()],
            forState: UIControlState.Normal
        )

        navigationItem.leftBarButtonItem = filterButton

        search("Italian")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
//        return businesses.count
        if let businesses = self.businesses {
            return businesses.count
        } else {
            return 0
        }
    }

    func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "ListingTableViewCell"
        ) as ListingTableViewCell

        let business = Business(json: businesses[indexPath.row])
        cell.populate(business)

        return cell
    }

    func search (query: String) {
        YelpClient().searchWithTerm(
            query,
            success: {(operation: AFHTTPRequestOperation!, response: AnyObject!)
                -> Void in
                self.json = JSON(response)
                self.businesses = self.json["businesses"]
                println(response)
                self.tableView.reloadData()
            },
            failure: {(operation: AFHTTPRequestOperation!, error: NSError!)
                -> Void in
                println(error)
            }
        )
    }

    func goToFilter() {
        self.performSegueWithIdentifier("filterSegue", sender: tableView)
    }

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if (segue.identifier == "filterSegue") {
//            var filtersViewController = segue.destinationViewController as FiltersViewController
//            filtersViewController.delegate = self
//        }
//    }
}
