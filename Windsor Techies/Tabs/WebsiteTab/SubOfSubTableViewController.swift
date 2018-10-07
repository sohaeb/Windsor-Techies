//
//  SubOfSubTableViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-24.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit

class SubOfSubTableViewController: UITableViewController {
    
    var child = [Children]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return child.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = child[indexPath.row].title.removeAmperSand()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? WebSiteViewController {
            
            if let selectedIndex = tableView.indexPathForSelectedRow {
                
                destinationViewController.link = child[selectedIndex.row].url
            }
        }
    }
    
}
