//
//  WebSiteViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-24.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit

class WebSiteViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    var link: String?
    
    @IBOutlet weak var justAnIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Inside web1")
        webView.delegate = self
        print("Inside web2")
        if let link = link {
            print("Inside web3")
                 webView.loadRequest(URLRequest(url: URL(string: link)!))
            print("Inside web4")
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {

        justAnIndicator.startAnimating()
        return true
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        justAnIndicator.stopAnimating()
    }
}
