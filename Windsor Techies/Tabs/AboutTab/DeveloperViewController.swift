//
//  DeveloperViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-24.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit

class DeveloperViewController: UIViewController {
    
    @IBOutlet weak var versionLabel: UILabel!
    
    @IBAction func clickAButton(_ sender: UIButton) {
        if let buttonID = sender.restorationIdentifier {
            switch buttonID {
            case "1": break
          //  UIApplication.shared.openURL(URL(string: "https://github.com/sohaeb")!)
            case "2":
                UIApplication.shared.open(URL(string: "mailto:snabieel@gmail.com")!)
                
            default:
                print("Nothing yet")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        versionLabel.text = "V." + version + "." + build
        
    }
    
}
