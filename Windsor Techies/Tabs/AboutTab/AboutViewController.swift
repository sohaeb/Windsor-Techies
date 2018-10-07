//
//  AboutViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-16.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    
    @IBAction func ClickableButton(_ sender: UIButton) {
        if let id = sender.restorationIdentifier {
            switch id {
            case "1":
                
                let url = URL(string: "https://facebook.com/QuickenLoans")!
                
                UIApplication.shared.open(url, options: [UIApplicationOpenURLOptionUniversalLinksOnly : true], completionHandler: { (success) in
                    if !success {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                    print("fb")
                })
                
            case "2":
                let url = URL(string: "https://twitter.com/QuickenLoans")!
                
                UIApplication.shared.open(url, options: [UIApplicationOpenURLOptionUniversalLinksOnly : true], completionHandler: { (success) in
                    if !success {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                    print("twitter")
                })
                
            case "3":
                let url = URL(string: "https://youtube.com/")!
                
                UIApplication.shared.open(url, options: [UIApplicationOpenURLOptionUniversalLinksOnly : true], completionHandler: { (success) in
                    if !success {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                    print("youtube")
                })
                
            case "4":
            
            let url = URL(string: "snapchat://add/uwindsormsa")!
            
            UIApplication.shared.open(url, options: [UIApplicationOpenURLOptionUniversalLinksOnly : true], completionHandler: { (success) in
                if !success {
                    UIApplication.shared.open(URL(string: "https://www.snapchat.com/add/uwindsormsa")!, options: [:], completionHandler: nil)
                }
                print("snapchat")
            })
            case "5":
                // mailing list
                //                UIApplication.shared.openURL(NSURL(string: "google.com")! as URL)
                
                UIApplication.shared.open(URL(string: "http://uwindsormsa.com/mailing-list/")!, options: [:], completionHandler: {
                    
                    (success) in
                    
                    print("Open \("google.com"): \(success)")
                    print("mailing list")
                })
                
                //                UIApplication.shared.open
                
            case "6":
                // volunteer
                UIApplication.shared.open(NSURL(string: "http://uwindsormsa.com/volunteer/")! as URL, options: [:], completionHandler: { (success) in
                    print("volunteer")
                })
                
            case "8":
                // instagram
                
                let url = URL(string: "https://www.instagram.com/quickenloans/")!
                UIApplication.shared.open(url, options: [UIApplicationOpenURLOptionUniversalLinksOnly : true], completionHandler: { (success) in
                    if !success {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                    print("youtube")
                })
                
            default:
                
                UIApplication.shared.open(NSURL(string: "mailto://Help@QuickenLoans.com")! as URL, options: [:], completionHandler: { (success) in
                    print("mailt")
                })
                
            }
        }
    }
    
    
    @IBAction func mailButtonForDesignPage(_ sender: UIButton) {
        
        UIApplication.shared.open(NSURL(string: "mailto://snabieel@gmail.com")! as URL, options: [:], completionHandler: { (success) in
            print("mailt to suhaib")
        })
    }
}
