//
//  EventsTableViewController.swift
//  uwindsormsa
//
//  Created by may on 2016-09-12.
//  Copyright © 2016 may. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import Crashlytics



class EventsTableViewController_fb: UITableViewController {
    
//    // MARK:
//    // MARK: Outlets
//    
//    @IBOutlet weak var justAtable: UITableView!
//    // @IBOutlet weak var segmentControlOutlet: UISegmentedControl!
//    
//    // MARK:
//    // MARK: Actions
//    
//    //    @IBAction func segmentedControllTest(_ sender: UISegmentedControl) {
//    //        if sender.selectedSegmentIndex == 0 {
//    //            print("Would this get called ? [Segment 0]")
//    //
//    //            CoolArray = [Event]()
//    //            //("reseted the events")
//    //            tableView.reloadData()
//    //            //uwindsorMSA(boolCheckMark: true)
//    //            viewWillAppear(true)
//    //
//    //        } else if sender.selectedSegmentIndex == 1 {
//    //            print("Would this get called ?")
//    //            CoolArray = [Event]()
//    //            tableView.reloadData()
//    //            //("calling segmentedControl 2")
//    //            removeTheNoUpcomingIMage()
//    //            //tableView.reloadData()
//    //            uwindsorMSA(boolCheckMark: false)
//    //        }
//    //    }
//    
//    // MARK:
//    // MARK: Properties
//    
//    var CoolArray = [Event]()
//    var countingEvents = 0
//    let image = UIImageView(image: UIImage(named: "Group"))
//    let spinner = UIActivityIndicatorView()
//    
//    
//    struct FacebookParameters {
//        static let MSA = "/uwindsormsa/events"
//        static let OSP = "/OSPUWindsor/events"
//        static let parameter = "name,cover,start_time,end_time,place,description, owner"
//        static let accessToken = "301801280168696|b63d674b51ab4f9c3a3045768c733af0"
//        static let limit = 25
//    }
//    
//    // MARK:
//    // MARK: Methods
//    
//    func addSpinner(){
//        
//        spinner.center = justAtable.center
//        spinner.center.y = image.center.y - CGFloat(50)
//        spinner.color = UIColor.blue
//        justAtable.addSubview(spinner)
//        
//        spinner.startAnimating()
//    }
//    
//    func remmoveSpinner() {
//        spinner.stopAnimating()
//        spinner.removeFromSuperview()
//    }
//    
//    func addTheNoUpcomingEventImage(){
//        //("Calling the addTheNoUpcomingEventImage func")
//        image.center = justAtable.center
//        image.center.y = justAtable.center.y -  CGFloat(100)
//        justAtable.addSubview(image)
//    }
//    
//    func removeTheNoUpcomingIMage(){
//        image.removeFromSuperview()
//    }
//    
//    //------------------------------------------------
//    
//    // MARK: - Facebook Events
//    
//    func requestFBSDK(name: String, date: String) -> FBSDKGraphRequest {
//        
//        return FBSDKGraphRequest(graphPath: name,
//                                 parameters: [
//                                    "fields": FacebookParameters.parameter,
//                                    "limit": FacebookParameters.limit,
//                                    "access_token": FacebookParameters.accessToken,
//                                    "since": date,
//                                    ],
//                                 httpMethod: "GET")
//    }
//    
//    //------------------------------------------------
//    
//    func fetchingEvents(result: Any, date: String){
//        
//        var latitueOfEvent: Double? = nil
//        var longitudeOfEvent: Double? = nil
//        var noLocation = false
//        var placeOfEvent = "N/A"
//        var eventDescription = "N/A"
//        var endDate = "N/A"
//        
//        if let some = result as? [String : AnyObject] {
//            if let fbData = some["data"] as? [[String : AnyObject]] {
//                for (_, event) in fbData.enumerated() {
//                    if let nameOfEvent = event["name"] as? String,
//                        let startOfEvent = event["start_time"] as? String,
//                        let owner = event["owner"]?["name"] as? String,
//                        let value = event["cover"]?["source"] as? String,
//                        let url = NSURL(string: value)
//                    {
//                        let data = NSData(contentsOf: (url as URL))
//                        let image = UIImage(data: (data as? Data)!)
//                        
//                        if let place = event["place"]?["name"] as? String {
//                            placeOfEvent = place
//                        } else {
//                            placeOfEvent = "N/A"
//                        }
//                        
//                        //("Before location")
//                        if let theLocation = event["place"]?["location"] as? [String: AnyObject],
//                            let latitude =  theLocation["latitude"] as? Double,
//                            let longitude = theLocation["longitude"] as? Double
//                        {
//                            latitueOfEvent = Double(latitude)
//                            longitudeOfEvent = Double(longitude)
//                        } else {
//                            noLocation = true
//                            latitueOfEvent = Double(42.3149)
//                            longitudeOfEvent = Double(-83.0364)
//                        }
//                        
//                        if let eventOfDescription = event["description"] as? String {
//                            eventDescription = eventOfDescription
//                        } else {
//                            eventDescription = "N/A"
//                        }
//                        
//                        if let endOfEvent = event["end_time"] as? String {
//                            endDate = PlayingWithDateAndTime.creatingTheDateFromTemplate(date: endOfEvent, time: true)
//                            //let endDateTheTime = PlayingWithDateAndTime.gettingDateOnly(date: endOfEvent)
//                        } else {
//                            endDate = "N/A"
//                        }
//                        print("start of event value is \(startOfEvent)")
//                        // //("details")
//                        let dateOnly = PlayingWithDateAndTime.creatingTheDateFromTemplate(date: startOfEvent, time: false)
//                        
//                        let startTime = PlayingWithDateAndTime.creatingTheDateFromTemplate(date: startOfEvent, time: true)
//                        let startAndEnd = PlayingWithDateAndTime.concatenatingBothDates(startDate: startTime, endDate: endDate)
//                        
//                        let one = Event(name: nameOfEvent, start: dateOnly, end: startAndEnd, description: eventDescription, image: image!, place: placeOfEvent, owner: owner, lat: latitueOfEvent!, long: longitudeOfEvent!, location: noLocation)
//                        self.CoolArray.append(one)
//                        
//                        if date == "now" {
//                            countingEvents += 1
//                        }
//                    }
//                    
//                    remmoveSpinner()
//                    // let numOfEvents = "Upcoming (\(countingEvents))"
//                    // segmentControlOutlet.setTitle(numOfEvents, forSegmentAt: 0)
//                }
//                
//                if (CoolArray.count == 0){
//                    addTheNoUpcomingEventImage()
//                } else {
//                    removeTheNoUpcomingIMage()
//                }
//                self.tableView.reloadData()
//            }
//        }
//        //("Done reading stuff")
//    }
//    
//    //------------------------------------------------//
//    
//    func uwindsorMSA(boolCheckMark: Bool) {
//        
//        let connection = FBSDKGraphRequestConnection()
//        
//        if (boolCheckMark) {
//            
//            connection.add(requestFBSDK(name: FacebookParameters.MSA, date: "now")) { (connection, result, error) in
//                self.fetchingEvents(result: result, date: "now")
//            }
//            connection.add(requestFBSDK(name: FacebookParameters.OSP, date: "now"), completionHandler: { (connection, result, error) in
//                self.fetchingEvents(result: result, date: "now")
//            })
//            
//            countingEvents = 0
//            
//        } else {
//            
//            addSpinner()
//            
//            connection.add(requestFBSDK(name: FacebookParameters.MSA, date: "")) { (connection, result, error) in
//                self.fetchingEvents(result: result, date: "")
//            }
//            connection.add(requestFBSDK(name: FacebookParameters.OSP, date: ""), completionHandler: { (connection, result, error) in
//                self.fetchingEvents(result: result, date: "")
//            })
//        }
//        
//        connection.start()
//    }
//    
//    //------------------------------------------------//
//    
//    // MARK:
//    // MARK: ViewDidMethods()
//    
//    override func viewWillAppear(_ animated: Bool) {
//        //        self.tableView.contentInset = UIEdgeInsetsMake(2.0, 0.0, 40.0 , 0.0)
//        //Fixed instead using storybaord extend under tab = No
//        //("view Will Appear")
//        
//        addSpinner()
//        let queue = DispatchQueue(label: "wew")
//        CoolArray = []
//        
//        queue.async {
//            
//            //let thumbnail = image.resize(to: thumbnailSize(for: image))
//            self.uwindsorMSA(boolCheckMark: true) //If set to false, it will display previous events too
//            
//            //self.CoolArray = [Event]()
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//        
//        
//    }
//    
//    // MARK:
//    // MARK: Delegate Methods
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        return CoolArray.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
//        
//        let oneRow = CoolArray[indexPath.row]
//        
//        cell.justAnImage.image = oneRow.image
//        cell.start.text = oneRow.start
//        cell.end.text = oneRow.end
//        cell.place.text = oneRow.place
//        remmoveSpinner()
//        return cell
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "displayDetails"{
//            if let dvc = segue.destination as? EventDetailsViewController {
//                
//                if let indexPathCell = tableView.indexPathForSelectedRow {
//                    //("im inside")
//                    dvc.value = CoolArray[indexPathCell.row].description
//                    dvc.imageOfEvent = CoolArray[indexPathCell.row].image
//                    dvc.name = CoolArray[indexPathCell.row].name
//                    dvc.lat = CoolArray[indexPathCell.row].lat
//                    dvc.long = CoolArray[indexPathCell.row].long
//                    dvc.noLocation = CoolArray[indexPathCell.row].location
//                    dvc.nameOfTheEvent = CoolArray[indexPathCell.row].name
//                }
//            }
//        }
//    }
}


