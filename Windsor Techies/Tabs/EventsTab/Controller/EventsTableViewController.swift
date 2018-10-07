//
//  EventsTableViewController.swift
//  uwindsormsa
//
//  Created by may on 2016-09-12.
//  Copyright © 2016 may. All rights reserved.
//

import UIKit
import Firebase
class EventsTableViewController: UITableViewController {
    
    // MARK:
    // MARK: Outlets
    
    @IBOutlet weak var justAtable: UITableView!
    // @IBOutlet weak var segmentControlOutlet: UISegmentedControl!
    
    // MARK:
    // MARK: Actions
    
    // MARK:
    // MARK: Properties
    
    var newEvents = [Event]()
    var newEvents2 = [Event]()
    var ref: DatabaseReference!
    
    var countingEvents = 0
    let image = UIImageView(image: UIImage(named: "Group"))
    
    // MARK:
    // MARK: Methods
    
    func addTheNoUpcomingEventImage(){
        //("Calling the addTheNoUpcomingEventImage func")
        image.center = justAtable.center
        image.center.y = justAtable.center.y -  CGFloat(100)
        justAtable.addSubview(image)
    }
    
    func removeTheNoUpcomingIMage(){
        image.removeFromSuperview()
    }
    
    func readFromFirebase() {
        
        var events = [Event]()
        
        ref = Database.database().reference(withPath: "server/events")
        
        // To find how many FB pages has events
        
        
        ref.observe(.value, with: { (snapshot) in
            
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            print(postDict)
            
           
            
//            index = Int(snapshot.childrenCount)
           // //("Index is ")
            // To loop each page
            //for i in 0..<12 {
                
                // We will get the 1st FB page
//                self.ref = Database.database().reference(withPath: "server/events")
            
//                self.ref.observe(DataEventType.value, with: { (snapshot) in
                    //("How many is this called?")
                    // We will get the all the child **events**
//            print("the values ares : \(snapshot.children.allObjects as! [DataSnapshot])")
                    for rest in snapshot.children.allObjects as! [DataSnapshot] {
                        
//                        print("rest is \(rest)")
            
                        // rest --> {0 or 1 or 2 or etc.....
                        //                        let childSnapshot = rest.value as? [String : Any]
                        //
                        //                        if let someValue = childSnapshot?["name"] as? String {
                        //                            //("name is \(String(describing: someValue))")
                        //                        }
                        
                        let event = Event(snapshot: rest)
                        print(events)
                        events.append(event)
                    }
            
                    self.newEvents = events
//
            print("the # of events is \(self.newEvents.count)")
            if self.newEvents.count != 0 {
                self.removeTheNoUpcomingIMage()
            } else {
                
                self.addTheNoUpcomingEventImage()
            }
            
////            DispatchQueue.main.async {
////                print("dispatch inside func")
                self.tableView.reloadData()
////            /}
            
//            if snapshot.exists() && snapshot.value as! String == "42" {
//                print("The value is now 42")
//                self.ref.removeObserver(withHandle: handle)
//            }
        })
    }
    
    // MARK:
    // MARK: ViewDidMethods()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
                self.readFromFirebase()

            }
    
    // MARK:
    // MARK: Delegate Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
                print("reload tableView --- section")
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                print("reload tableView ----  rows")
        return newEvents.count
        
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //("Is this called")
//        performSegue(withIdentifier: "displayDetails", sender: indexPath)
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("reload tableView ----- cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
//        ("Cell is \(newEvents[indexPath.row])")
        let oneRow = newEvents[indexPath.row]
        
        cell.justAnImage.image = oneRow.image
        cell.start.text = PlayingWithDateAndTime.creatingTheDateFromTemplate(date: oneRow.start!, time: false)
        cell.end.text = PlayingWithDateAndTime.concatenatingBothDates(startDate: oneRow.start!, endDate: oneRow.end!)
        cell.place.text = oneRow.place
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "displayDetails"{
            //("test")
            if let dvc = segue.destination as? EventDetailsViewController {
            //("test1")
                //("index is \(String(describing: tableView.indexPathForSelectedRow))")
                if let indexPathCell = self.tableView.indexPathForSelectedRow {
                    //("test2")
                    //("index is \(String(describing: indexPathCell))")
                    //("im inside")
                    dvc.value = newEvents[indexPathCell.row].description
                    //("test3")

                    dvc.imageOfEvent = newEvents[indexPathCell.row].image
                    //("test4")

                    dvc.name = newEvents[indexPathCell.row].name
                    //("test5")

                    dvc.lat = newEvents[indexPathCell.row].lat
                    //("test6")

                    dvc.long = newEvents[indexPathCell.row].long
                    //("test7")

//                    dvc.locationExist = newEvents[indexPathCell.row].location
                    //("test8")

                    dvc.nameOfTheEvent = newEvents[indexPathCell.row].name
                    //("test9")
                    
                }
            }
        }
    }
}
