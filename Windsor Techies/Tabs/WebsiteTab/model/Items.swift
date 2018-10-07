//
//  Items.swift
//  UWindsor MSA
//
//  Created by may on 2018-01-20.
//  Copyright © 2018 sohaeb. All rights reserved.
//

import Foundation

struct MSA : Codable {
    let ID : Int
    let count : Int
    let items: [Items]
}

struct Items : Codable {
    let id : Int
    let title : String
    let url : String
    let description : String
     // Children is optional coz if JSON doesn't have a child then Xcode will display an encoding error and won't let them be displayed to TableFiew
    let children : [Children]?
}

struct Children : Codable {
    let title : String
    let url : String
    // Children is optional coz if JSON doesn't have a child then Xcode will display an encoding error and won't let them be displayed to TableFiew
    let children : [Children]?
}
