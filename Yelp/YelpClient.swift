//
//  YelpClient.swift
//  Yelp
//
//  Created by Timothy Lee on 9/19/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class YelpClient: BDBOAuth1RequestOperationManager {
    private let consumerKey = "u5lK2lrWU7IAR3QIEu04KQ"
    private let consumerSecret = "KwldfReN7JTQTjiufFOx9qXuRX4"
    private let accessToken = "vsprJ9N-TfpqiJtYlYOG3EZFaWuaIrhC"
    private let accessSecret = "2c-lwD9vE38DRiQYyRsqHWaSZC0"
    private let baseUrl = NSURL(string: "http://api.yelp.com/v2/")
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init(
            baseURL: baseUrl,
            consumerKey: consumerKey,
            consumerSecret: consumerSecret
        );

        self.requestSerializer.saveAccessToken(BDBOAuthToken(
            token: accessToken,
            secret: accessSecret,
            expiration: nil
        ))
    }
    
    func searchWithTerm(
        term: String,
        success: (AFHTTPRequestOperation!, AnyObject!) -> Void,
        failure: (AFHTTPRequestOperation!, NSError!) -> Void
    ) -> AFHTTPRequestOperation! {
        var parameters = ["term": term, "location": "San Francisco"]
        return self.GET("search", parameters: parameters, success: success, failure: failure)
    }
    
}


