//
//  tabBarController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-18.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit
//import DeviceKit
class tabBarController: UITabBarController {

//    let device = Device()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        switch device {
//        case .iPad2, .iPad3,.iPad4, .iPadAir,.iPadAir2, .iPadMini, .iPadMini2, .iPadMini3:
//
//            viewControllers?.remove(at: 2)
//        default:
//            break
//        }
        
        if let items = tabBar.items {
            for item in items {
                item.title = ""
                item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
            }
        }
    }
}
