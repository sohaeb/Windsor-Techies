//
//  SectionTableViewController.swift
//  UWindsor MSA
//
//  Created by may on 2018-01-25.
//  Copyright © 2018 sohaeb. All rights reserved.
//

import UIKit

class SectionTableViewController: UITableViewController {
    var tableArrayCount : Int? = nil
    var arrayOfItems = [Items]()
    
    let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
     let label = UILabel()
    
    func download() {
        //print("called10")
        let url = URL(string: "http://www.uwindsormsa.com/wp-json/wp-api-menus/v2/menus/60")
        
        URLSession.shared.dataTask(with: url!) {( data, response, error ) in
            
            DispatchQueue.main.async {
                self.label.removeFromSuperview()
            }
            
            print("called1")
            if error == nil {
//                self.label.removeFromSuperview()
            } else {
                print("The error inside URL Session is: \(String(describing: error?.localizedDescription))")
                
                DispatchQueue.main.async {
                    print("main async called now inside URL session")
                    self.myActivityIndicator.stopAnimating()
                    self.myActivityIndicator.removeFromSuperview()
                    
                    self.label.frame = CGRect(x: 0, y: 0, width: (self.tableView.bounds.size.width)/CGFloat(2), height: 50)
                    self.label.textAlignment = .center
                    self.label.numberOfLines = 2
                    self.label.center = self.tableView.center
                    self.label.textColor = .black
                    self.label.font = UIFont(name: "Avenir-Light", size: 15.0)
                    self.label.text = "Check your Internet Connection"
                    
                    self.view.addSubview(self.label)
                }
                
                print("check")
                
                return
            }
            print("called2")
            guard let content = data else {
                
                print("No data was downloaded using URL session")
                return
            }
            
            print("called3")
            let decoder = JSONDecoder()
            do {
                print("called4")
                let todo = try decoder.decode(MSA.self, from: content)
                print(todo.items)
                self.tableArrayCount = todo.items.count
                self.arrayOfItems = todo.items
                //            tableArray = todo.items.id
                //                for item in todo.items {
                //                    self.titles.append(item.title)
                //                    self.descriptions.append(item.description)
                //                    if let children = item.children {
                //                        ////                        for c in children {
                //                        ////                            self.childrens[key] = c
                //                        ////                        }
                //                    }
                //
                //                }
                //            let anotherTodo = try decoder.decode(Items.self, from: content)
                //            print(anotherTodo)
                //            self.tableArray = todo.items.id
                
                
                //            completionHandler(todo, nil)
            } catch {
                print("error trying to convert data to JSON in URLsession taks func")
                //            completionHandler(nil, error)
            }
            
            //        let decoder = JSONDecoder()
            //
            //        let container = try decoder.container(keyedBy: MSA.self)
            //
            //        let ID: String = try container.decode(Int.self, forKey: .ID)
            
            //            print(self.tableArrayCount)
            
            
            
            print("called5")
            DispatchQueue.main.async {
                print("dispatch inside func")
                self.tableView.reloadData()
                self.myActivityIndicator.stopAnimating()
                self.myActivityIndicator.removeFromSuperview()
            }
            }.resume()
        
        print("reached end of URL session func")
    }
    
    func createActivityIndicator(){
        
        //        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        
        // Position Activity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = false
        
        // Start Activity Indicator
        myActivityIndicator.startAnimating()
        
        // Call stopAnimating() when need to stop activity indicator
        //myActivityIndicator.stopAnimating()
        
        view.addSubview(myActivityIndicator)
    }
    
    func addUILabel() {
       
      
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        createActivityIndicator()
        //        print("start")
        self.download()
        //        print("end")
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = arrayOfItems[indexPath.row].title.removeAmperSand()
        cell.detailTextLabel?.text = arrayOfItems[indexPath.row].description
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("1- called section func")
        return self.arrayOfItems.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Why1")
        if arrayOfItems[indexPath.row].children?.count != nil {
            // Has sub-pages
            print("Why2")
            performSegue(withIdentifier: "1", sender: indexPath)
        } else {
            // Page with URL i.e: Store
            print("Why3")
            performSegue(withIdentifier: "2", sender: indexPath)
        }
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Here1")
        
        
        
        // Important Note:
        // Never use if-else, coz this function always gets called
        // use case instead
        guard let identifier = segue.identifier else {
            print("we returned")
            return
        }
        
        switch identifier {
            
        case "1":
            print("1")
            // This means that a page has sub-pages.
            // so we push the current row details to the next tableView controller
            // to display the subpages
            print("Here2")
            if let path = sender as? IndexPath {
                print("Here3")
                if let dvc = segue.destination as? SubSectionTableViewController {
                    
                    dvc.item = arrayOfItems[path.row]
                    print(arrayOfItems[path.row])
                    
                }
            }
            
        case "2":
            // Just get the selected row's link and display the webapge in the webPageView
            //                        if sender as? IndexPath) != nil {
            // or
            print("2")
            print("Here4")
            if let path = sender as? IndexPath {
                print("Here5")
                if let dvc = segue.destination as? WebSiteViewController {
                    print("Here6")
                    dvc.link = arrayOfItems[path.row].url
                }
            }
            
        default:
            return
        }
    }
}

/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */
extension String {
    func removeAmperSand() -> String {
        return self.replacingOccurrences(of: "#038;", with: "")
    }
}

