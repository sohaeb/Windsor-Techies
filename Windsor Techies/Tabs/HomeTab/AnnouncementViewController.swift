//
//  SwifterViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-27.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit
import SwifteriOS


class AnnouncementViewController: UIViewController {
    
    @IBOutlet weak var dateOfTweetLabel: UILabel!
    @IBOutlet weak var textField: UITextView!
    
    
    var tweet = ""
    
    func parstingTwitter () {
        
        let another = Swifter(consumerKey: TwitterKeys.consumerKey , consumerSecret: TwitterKeys.consumerSecret , oauthToken: TwitterKeys.outhToken, oauthTokenSecret: TwitterKeys.outhSecret)
        
        
//  412816715
        another.getTimeline(for: "412816715", count: 25, sinceID: nil, maxID: nil, trimUser: false, contributorDetails: true, includeEntities: true, success: { (json) in
            
            for i in json.array! {
                
//                if let _ = i["retweeted_status"]["id_str"].string {
//                    continue
//                }
                
                let value = i["in_reply_to_status_id"].string
                print("value is \(String(describing: value))")
                
//                if i["in_reply_to_status_id"].string == nil {
//                    print("reply")
//                    continue
//                }
                
                if let dateOfTweet = i["created_at"].string {
                    
                    let newDate = dateOfTweet.components(separatedBy: " ")
                    
                    self.dateOfTweetLabel.text = "( " + newDate[0] + " " + newDate[1] + " " + newDate[2] + " )"
                }
                if let textofTweet = i["text"].string {
                    let modifiedText = textofTweet.replacingOccurrences(of: "amp;", with: "")
                    self.textField.text = modifiedText
                    break
                    
                }    // end of assigining tweet
            } // end of for loop
            
        }) { (error) in
            self.textField.textAlignment = .center
            self.textField.text = " Check your Internet Connection "
        }
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        self.parstingTwitter()
//        self.firebase()
        
    }
}
