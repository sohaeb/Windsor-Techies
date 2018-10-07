//
//  EventNavController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-22.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit

class EventNavController: UINavigationController {

    @IBOutlet weak var tabBar: UITabBarItem!
    
    override func viewWillAppear(_ animated: Bool) {
        
        // We use this because Navigation Contoller is in another Storyboard.
        
        tabBar.title = ""
        tabBar.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
    }
}
