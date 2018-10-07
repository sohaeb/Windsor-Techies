//
//  SubSectionTableViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-20.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit

class SubSectionTableViewController: UITableViewController {
    
    var item : Items?
    
    @IBOutlet weak var titleOfMenu: UILabel!
    
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
        return (item!.children!.count)
    }
    
    ///*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //print("Cell is")
        //print(cellDetails[indexPath.row])
        
        let name = item!.children![indexPath.row]
        cell.textLabel?.text = name.title.removeAmperSand()
        
        return cell
    }
    
    ///*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else {
            //print("we returned")
            return
        }
        
        switch identifier {
            
        case "1":
            //print("1")
            // This means that a page has sub-pages.
            // so we push the current row details to the next tableView controller
            // to display the subpages
            //print("Here2")
            if let path = sender as? IndexPath{
                if let dvc = segue.destination as? SubOfSubTableViewController{
                    dvc.child = (item!.children?[path.row].children)!
                }
            }
            
        case "2":
            // Just get the selected row's link and display the webapge in the webPageView
            //                        if sender as? IndexPath) != nil {
            // or
            //print("2")
            //print("Here4")
        if let path = sender as? IndexPath {
            if let dvc = segue.destination as? WebSiteViewController {
                dvc.link = item!.children![path.row].url
            }
        }
            
        default:
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (item!.children![indexPath.row].children?.count) != nil {
            performSegue(withIdentifier: "1", sender: indexPath)
        } else {
            performSegue(withIdentifier: "2", sender: indexPath)
        }
    }
}
