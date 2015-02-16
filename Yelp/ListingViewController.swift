//
//  ListingViewController.swift
//  Yelp
//
//  Created by Jehan Tremback on 2/15/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class ListingViewController: UIViewController {
    var client: YelpClient!
    
    // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
    let yelpConsumerKey = "u5lK2lrWU7IAR3QIEu04KQ"
    let yelpConsumerSecret = "KwldfReN7JTQTjiufFOx9qXuRX4"
    let yelpToken = "RmkNSbo01LemyGxLyBOMr5EtWrvzvovY"
    let yelpTokenSecret = "A2TYX-qjMQp9DVqhr5Mgg2nko-k"
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        client = YelpClient(
            consumerKey: yelpConsumerKey,
            consumerSecret: yelpConsumerSecret,
            accessToken: yelpToken,
            accessSecret: yelpTokenSecret
        )
        
        client.searchWithTerm(
            "Thai",
            success: { (
                operation: AFHTTPRequestOperation!,
                response: AnyObject!
            ) -> Void in
            println(response)
        }) { (
            operation: AFHTTPRequestOperation!,
            error: NSError!
        ) -> Void in
            println(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
