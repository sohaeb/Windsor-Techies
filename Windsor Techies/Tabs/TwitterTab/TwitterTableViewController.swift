//
//  TwitterTableViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-16.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit
import TwitterKit
//import Crashlytics

class TwitterTableViewController: TWTRTimelineViewController {
    
    func showTimeline() {
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "sockington",
                                                     userID: nil,
                                                     apiClient: client,
                                                     maxTweetsPerRequest: 15,
                                                     includeReplies: false,
                                                     includeRetweets: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        showTimeline()
    }
}
