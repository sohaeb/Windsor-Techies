//
//  FeedbackWebPageViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-19.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit

class FeedbackWebPageViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadRequest(URLRequest(url: URL(string: "https://goo.gl/forms/jaqzeBvsCowilWE52")!))
    }
}
